import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Functions/request_storage_permission.dart';
import 'package:goodwishes/Functions/show_info_dialog.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/pages/text_dialog.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> backupHiveBox<T>(String boxName, String backupDirPath) async {
  final box = Hive.isBoxOpen(boxName)
      ? Hive.box<T>(boxName)
      : await Hive.openBox<T>(boxName);
  final boxPath = box.path!;
  await box.close();

  final backupFilePath = '$backupDirPath/$boxName.hive';

  try {
    await File(boxPath).copy(backupFilePath);
    print('Backup of $boxName completed: $backupFilePath');
  } catch (e) {
    print('Error backing up $boxName: $e');
  } finally {
    await Hive.openBox<T>(boxName);
  }
}

Future<void> backupAllData(BuildContext context) async {
  await requestStoragePermission(context);

  await showInfoDialog(
    context,
    '백업을 진행하면, 기존의 백업데이터는 사라집니다.',
    '경고',
    onPressed: () async {
      final directory = await getDownloadDirectory();
      final backupDirPath = '${directory.path}/goodwishes_backup';
      final backupDir = Directory(backupDirPath);
      if (!backupDir.existsSync()) {
        backupDir.createSync();
      }

      List<String> hiveBoxNames = [
        'goodsListBox',
        'wishListBox',
        'categoryListBox',
        'profileBox',
        'wishCategoryListBox',
      ];

      for (String boxName in hiveBoxNames) {
        if (boxName == 'goodsListBox') {
          await backupHiveBox<Goods>(boxName, backupDirPath);
        } else if (boxName == 'wishListBox') {
          await backupHiveBox<Wish>(boxName, backupDirPath);
        } else if (boxName == 'profileBox') {
          await backupHiveBox<Profile>(boxName, backupDirPath);
        } else {
          await backupHiveBox<Category>(boxName, backupDirPath);
        }
      }

      showInfoDialog(context, '백업이 완료됐습니다.', '알림');
    },
    onCancled: true,
  );
}

Future<void> restoreHiveBox<T>(String boxName, String backupDirPath) async {
  final box = Hive.isBoxOpen(boxName)
      ? Hive.box<T>(boxName)
      : await Hive.openBox<T>(boxName);

  final boxPath = box.path!;
  await box.close();

  final backupFilePath = '$backupDirPath/$boxName.hive';

  print('Restoring $boxName from $backupFilePath to $boxPath');

  try {
    if (await File(backupFilePath).exists()) {
      await File(backupFilePath).copy(boxPath);
      print('Restore of $boxName completed: $backupFilePath');
    } else {
      print('Backup file does not exist: $backupFilePath');
    }
  } catch (e) {
    print('Error restoring $boxName: $e');
  } finally {
    await Hive.openBox<T>(boxName);
  }
}

Future<void> restoreAllData(BuildContext context) async {
  await requestStoragePermission(context);
  final directory = await getDownloadDirectory();
  final backupDirPath = '${directory.path}/goodwishes_backup';
  final backupDir = Directory(backupDirPath);

  if (backupDir.existsSync()) {
    List<String> hiveBoxNames = [
      'goodsListBox',
      'wishListBox',
      'categoryListBox',
      'profileBox',
      'wishCategoryListBox',
    ];

    for (String boxName in hiveBoxNames) {
      if (boxName == 'goodsListBox') {
        await restoreHiveBox<Goods>(boxName, backupDirPath);
      } else if (boxName == 'wishListBox') {
        await restoreHiveBox<Wish>(boxName, backupDirPath);
      } else if (boxName == 'profileBox') {
        await restoreHiveBox<Profile>(boxName, backupDirPath);
      } else {
        await restoreHiveBox<Category>(boxName, backupDirPath);
      }
    }
  } else {
    print('Backup directory does not exist: $backupDirPath');
  }

  // context: context,
  // builder: (context) {
  //   return TextDialog(
  //     text: '백업 후 앱을 재시작합니다.',
  //     onPressed: () {
  //       // 앱 종료
  //       if (Platform.isIOS) {
  //         exit(0);
  //       } else {
  //         SystemNavigator.pop();
  //       }
  //     },
  //   );
  // });

  await showInfoDialog(
    context,
    '복원 후 앱을 재시작합니다.',
    '알림',
    onPressed: () {
      // 앱 종료
      if (Platform.isIOS) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
    },
  );
}

Future<Directory> getDownloadDirectory() async {
  if (Platform.isAndroid) {
    return Directory('/storage/emulated/0/Download');
  } else if (Platform.isIOS) {
    return await getApplicationDocumentsDirectory();
  } else {
    throw UnsupportedError('Platform not supported');
  }
}

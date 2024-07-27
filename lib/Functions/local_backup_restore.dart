import 'dart:io';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> backupHiveBox<T>(String boxName, String backupDirPath) async {
  final box = await Hive.openBox<T>(boxName);
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

Future<void> backupAllData() async {
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
}

Future<void> restoreHiveBox<T>(String boxName, String backupDirPath) async {
  final box = await Hive.openBox<T>(boxName);
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

Future<void> restoreAllData() async {
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

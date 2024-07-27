import 'dart:io';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

Future<void> restoreHiveData() async {
  final directory = await getDownloadDirectory();
  final backupDir = Directory('${directory.path}/goodwishes_backup');

  if (backupDir.existsSync()) {
    List<FileSystemEntity> backupFiles = backupDir.listSync();
    print('Files in backup directory: $backupFiles'); // 파일 목록 확인

    for (var backupFile in backupFiles) {
      if (backupFile is File) {
        // final fileName = backupFile.uri.pathSegments.last;
        final boxName = backupFile.uri.pathSegments.last.split('.').first;
        print('Restoring box: $boxName'); // 복원 중인 박스 이름 확인

        Box box;
        if (boxName == 'goodsListBox')
          box = Hive.box<Goods>(boxName);
        else if (boxName == 'wishListBox')
          box = Hive.box<Wish>(boxName);
        else if (boxName == 'profileBox')
          box = Hive.box<Profile>(boxName);
        else
          box = Hive.box<Category>(boxName);

        final bytes = await backupFile.readAsBytes();
        await box.fromBytes(bytes);
      }
    }
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

extension on Box {
  Future<void> fromBytes(List<int> bytes) async {
    clear();
    var entries = String.fromCharCodes(bytes).split('\n'); // 엔터 대신 줄바꿈으로 분리
    for (var entry in entries) {
      var kv = entry.split(':');
      if (kv.length == 2) {
        await put(kv[0], kv[1]);
      }
    }
  }
}

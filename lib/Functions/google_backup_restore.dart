import 'dart:io';
import 'package:goodwishes/Functions/google_drive_service.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class HiveBackupRestore {
  final GoogleDriveService _googleDriveService = GoogleDriveService();

  Future<void> backupHiveBox<T>(String boxName) async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<T>(boxName)
        : await Hive.openBox<T>(boxName);
    final boxPath = box.path!;
    // await box.close();

    final backupFile = File(boxPath);
    if (_googleDriveService.currentUser == null) {
      await _googleDriveService.signInGoogle();
    }

    await _googleDriveService.uploadFile(file: backupFile);
    print('backup $boxName');
    // await Hive.openBox<T>(boxName);
  }

  Future<void> restoreHiveBox<T>(String boxName) async {
    if (_googleDriveService.currentUser == null) {
      await _googleDriveService.signInGoogle();
    }

    final driveFile = await _googleDriveService.getDriveFile(filename: boxName);
    if (driveFile != null) {
      final localDir = await getApplicationDocumentsDirectory();
      final localPath = path.join(localDir.path, boxName);

      final downloadedFile = await _googleDriveService.downloadFile(
          driveFileId: driveFile.id!, localPath: localPath);
      if (downloadedFile != null) {
        await Hive.openBox<T>(boxName);
      }
    }
  }
}

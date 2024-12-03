import 'dart:io';
import 'package:goodwishes/Functions/google_drive_service.dart';
import 'package:hive/hive.dart';

class HiveBackupRestore {
  final GoogleDriveService _googleDriveService = GoogleDriveService();

  Future<void> backupHiveBox<T>(String boxName) async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<T>(boxName)
        : await Hive.openBox<T>(boxName);
    final boxPath = box.path!;

    final backupFile = File(boxPath);
    if (_googleDriveService.currentUser == null) {
      await _googleDriveService.signInGoogle();
    }

    final existingFile = await _googleDriveService.getDriveFile(
        filename: '${boxName}.hive'.toLowerCase());
    if (existingFile != null) {
      await _googleDriveService.deleteFile(existingFile.id!);
    }

    // Upload the new backup file
    final driveFile = await _googleDriveService.uploadFile(file: backupFile);
    print('Backup completed for $boxName: ${driveFile?.name}');
  }

  Future<void> restoreHiveBox<T>(String boxName) async {
    if (_googleDriveService.currentUser == null) {
      await _googleDriveService.signInGoogle();
    }

    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<T>(boxName)
        : await Hive.openBox<T>(boxName);
    final boxPath = box.path!;

    final driveFile =
        await _googleDriveService.getDriveFile(filename: '$boxName.hive');
    print('Drive file for $boxName: $driveFile');
    if (driveFile != null) {
      final downloadedFile = await _googleDriveService.downloadFile(
          driveFileId: driveFile.id!, localPath: boxPath);

      print('Restore completed for $boxName');
    } else {
      print('No file found for $boxName in Google Drive');
    }
  }
}

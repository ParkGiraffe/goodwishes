import 'dart:io';
import 'package:goodwishes/Functions/google_drive_service.dart';
import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

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

    // Check if the file already exists in Google Drive and delete it
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
    // await box.close();

    final driveFile =
        await _googleDriveService.getDriveFile(filename: '$boxName.hive');
    print('Drive file for $boxName: $driveFile');
    if (driveFile != null) {
      // final localDir = await getApplicationDocumentsDirectory();
      // final localPath = path.join(boxPath, '$boxName.hive');

      final downloadedFile = await _googleDriveService.downloadFile(
          driveFileId: driveFile.id!, localPath: boxPath);
      // print(driveFile.id);
      // print(localPath);
      print('downloadedFile " $downloadedFile');
      // if (downloadedFile != null) {
      //   await Hive.openBox<T>(boxName);
      // }

      print('Restore completed for $boxName');
    } else {
      print('No file found for $boxName in Google Drive');
    }
  }
}

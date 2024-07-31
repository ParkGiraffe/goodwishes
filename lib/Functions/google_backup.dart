// backup_service.dart
import 'dart:io';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'google_drive_service.dart';

class BackupService {
  final GoogleDriveService _googleDriveService;

  BackupService(this._googleDriveService);

  Future<void> backupHiveBox(String boxName) async {
    if (!_googleDriveService.isSignedIn()) {
      await _googleDriveService.signIn();
    }

    final directory = await getApplicationDocumentsDirectory();
    final boxPath = p.join(directory.path, '$boxName.hive');
    final file = File(boxPath);

    if (await file.exists()) {
      final driveApi = drive.DriveApi(_googleDriveService.client!);
      final driveFile = drive.File();
      driveFile.name = '$boxName.hive';
      driveFile.parents = ['appDataFolder'];

      await driveApi.files.create(
        driveFile,
        uploadMedia: drive.Media(file.openRead(), file.lengthSync()),
      );

      print('Backup of $boxName completed.');
    } else {
      print('Box file does not exist.');
    }
  }
}

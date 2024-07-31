// restore_service.dart
import 'dart:io';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'google_drive_service.dart';

class RestoreService {
  final GoogleDriveService _googleDriveService;

  RestoreService(this._googleDriveService);

  Future<void> restoreHiveBox(String boxName) async {
    if (!_googleDriveService.isSignedIn()) {
      await _googleDriveService.signIn();
    }

    final driveApi = drive.DriveApi(_googleDriveService.client!);
    final list = await driveApi.files.list(spaces: 'appDataFolder');
    final file = list.files!.firstWhere((file) => file.name == '$boxName.hive');

    if (file != null) {
      final directory = await getApplicationDocumentsDirectory();
      final boxPath = p.join(directory.path, '$boxName.hive');
      final downloadFile = File(boxPath);
      final media = await driveApi.files.get(file.id!,
          downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;

      final saveFile = await downloadFile.openWrite();
      await saveFile.addStream(media.stream);
      await saveFile.close();

      print('Restore of $boxName completed.');
    } else {
      print('Backup file does not exist on Google Drive.');
    }
  }
}

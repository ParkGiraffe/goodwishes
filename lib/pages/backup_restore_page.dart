// backup_restore_page.dart
import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/google_backup.dart';
import 'package:goodwishes/Functions/google_drive_service.dart';
import 'package:goodwishes/Functions/google_restore.dart';

class BackupRestorePage extends StatefulWidget {
  const BackupRestorePage({super.key});

  @override
  _BackupRestorePageState createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  final GoogleDriveService _googleDriveService = GoogleDriveService();
  late BackupService _backupService;
  late RestoreService _restoreService;

  @override
  void initState() {
    super.initState();
    _backupService = BackupService(_googleDriveService);
    _restoreService = RestoreService(_googleDriveService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backup & Restore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await _backupService.backupHiveBox('goodsListBox');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Backup completed')),
                );
              },
              child: Text('Backup to Google Drive'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _restoreService.restoreHiveBox('goodsListBox');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Restore completed')),
                );
              },
              child: Text('Restore from Google Drive'),
            ),
          ],
        ),
      ),
    );
  }
}

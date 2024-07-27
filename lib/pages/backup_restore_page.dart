import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/local_backup.dart';
import 'package:goodwishes/Functions/local_backup_restore.dart';
import 'package:goodwishes/Functions/local_restore.dart';

class BackupRestorePage extends StatelessWidget {
  const BackupRestorePage({super.key});

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
                await backupAllData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Backup completed')),
                );
              },
              child: Text('Backup to Device'),
            ),
            ElevatedButton(
              onPressed: () async {
                await restoreAllData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Restore completed')),
                );
              },
              child: Text('Restore from Device'),
            ),
          ],
        ),
      ),
    );
  }
}

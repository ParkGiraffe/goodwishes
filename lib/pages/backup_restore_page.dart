import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/local_backup_restore.dart';
import 'package:goodwishes/widgets/section_title.dart';

class BackupRestorePage extends StatelessWidget {
  const BackupRestorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SectionTitle(titleText: 'Backup & Restore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 300,
              child: Text(
                '백업파일은 다운로드 폴더의\n[ goodWishes_backup ]\n폴더에 저장됩니다.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await backupAllData(context);
              },
              child: Text('백업파일 저장하기'),
            ),
            ElevatedButton(
              onPressed: () async {
                await restoreAllData(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Restore completed')),
                // );
              },
              child: Text('백업폴더에서 복원하기'),
            ),
          ],
        ),
      ),
    );
  }
}

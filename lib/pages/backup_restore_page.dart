import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Functions/google_backup_restore.dart';
import 'package:goodwishes/Functions/show_info_dialog.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/widgets/section_title.dart';

class BackupRestorePage extends StatelessWidget {
  final HiveBackupRestore _hiveBackupRestore = HiveBackupRestore();

  BackupRestorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> backupAllData() async {
      await showInfoDialog(
        context,
        '경고',
        '백업을 진행하면, 기존의 백업데이터는 사라집니다.',
        onCancled: true,
        onPressed: () async {
          await _hiveBackupRestore.backupHiveBox<Goods>('goodsListBox');
          await _hiveBackupRestore.backupHiveBox<Wish>('wishListBox');
          await _hiveBackupRestore.backupHiveBox<Category>('categoryListBox');
          await _hiveBackupRestore.backupHiveBox<Profile>('profileBox');
          await _hiveBackupRestore
              .backupHiveBox<Category>('wishCategoryListBox');

          showInfoDialog(
            context,
            '알림',
            '백업이 완료됐습니다.',
          );
        },
      );
    }

    Future<void> restoreAllData() async {
      await showInfoDialog(
        context,
        '경고',
        '복원을 진행하면, 앱이 재시작됩니다.',
        onCancled: true,
        onPressed: () async {
          await _hiveBackupRestore.restoreHiveBox<Goods>('goodsListBox');
          await _hiveBackupRestore.restoreHiveBox<Wish>('wishListBox');
          await _hiveBackupRestore.restoreHiveBox<Category>('categoryListBox');
          await _hiveBackupRestore.restoreHiveBox<Profile>('profileBox');
          await _hiveBackupRestore
              .restoreHiveBox<Category>('wishCategoryListBox');

          await showInfoDialog(
            context,
            '알림',
            '앱이 재시작됩니다.',
            onPressed: () {
              // 앱 종료
              if (Platform.isIOS) {
                exit(0);
              } else {
                SystemNavigator.pop();
              }
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: SectionTitle(titleText: 'Backup & Restore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                backupAllData();
              },
              child: const Text('구글 드라이브에 백업파일 저장하기'),
            ),
            ElevatedButton(
              onPressed: () async {
                restoreAllData();
              },
              child: const Text('구글 드라이브에 백업파일 복원하기'),
            ),
          ],
        ),
      ),
    );
  }
}

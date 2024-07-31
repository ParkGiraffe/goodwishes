import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/google_backup_restore.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/Models/wish_model.dart';

class BackupRestorePage extends StatelessWidget {
  final HiveBackupRestore _hiveBackupRestore = HiveBackupRestore();

  BackupRestorePage({super.key});

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
                await _hiveBackupRestore.backupHiveBox<Goods>('goodsListBox');
                await _hiveBackupRestore.backupHiveBox<Wish>('wishListBox');
                await _hiveBackupRestore
                    .backupHiveBox<Category>('categoryListBox');
                await _hiveBackupRestore.backupHiveBox<Profile>('profileBox');
                await _hiveBackupRestore
                    .backupHiveBox<Category>('wishCategoryListBox');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Backup completed')),
                );
              },
              child: Text('Backup to Google Drive'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _hiveBackupRestore.restoreHiveBox<Goods>('goodsListBox');
                await _hiveBackupRestore.restoreHiveBox<Wish>('wishListBox');
                await _hiveBackupRestore
                    .restoreHiveBox<Category>('categoryListBox');
                await _hiveBackupRestore.restoreHiveBox<Profile>('profileBox');
                await _hiveBackupRestore
                    .restoreHiveBox<Wish>('wishCategoryListBox');
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

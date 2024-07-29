import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/show_info_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission(BuildContext context) async {
  // 권한 상태 확인 및 요청
  var storageStatus = await Permission.manageExternalStorage.status;
  if (!storageStatus.isGranted) {
    await showInfoDialog(context,
        'Ensure you have granted storage permissions.', 'Permission Required');
    storageStatus = await Permission.manageExternalStorage.request();
  }

  if (storageStatus.isGranted) {
    print("Storage permission granted.");
  } else {
    print("Storage permission not granted.");
  }
}

import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  // 권한 상태 확인 및 요청
  var storageStatus = await Permission.manageExternalStorage.status;
  if (!storageStatus.isGranted) {
    storageStatus = await Permission.manageExternalStorage.request();
  }

  if (storageStatus.isGranted) {
    print("Storage permission granted.");
  } else {
    print("Storage permission not granted.");
  }
}

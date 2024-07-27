import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  if (await Permission.mediaLibrary.isGranted) {
    print("Media library permission granted.");
  } else {
    await Permission.mediaLibrary.request();
    if (await Permission.mediaLibrary.isGranted) {
      print("Media library permission granted.");
    } else {
      print("Media library permission not granted.");
    }
  }

  var status = await Permission.storage.status;
  if (!status.isGranted) {
    status = await Permission.storage.request();
  }
  if (status.isGranted) {
    print("Storage permission granted.");
  } else {
    print("Storage permission not granted.");
  }
}

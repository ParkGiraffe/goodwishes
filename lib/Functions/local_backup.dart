import 'dart:io';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> backupHiveData() async {
  final directory = await getDownloadDirectory();
  final backupDir = Directory('${directory.path}/goodwishes_backup');
  if (!backupDir.existsSync()) {
    backupDir.createSync();
  }

  List<String> hiveBoxNames = [
    'goodsListBox',
    'wishListBox',
    'categoryListBox',
    'profileBox',
    'wishCategoryListBox',
  ];

  for (int i = 0; i < 5; i++) {
    Box box;
    String boxName = hiveBoxNames[i];

    if (i == 0)
      box = Hive.box<Goods>(boxName);
    else if (i == 1)
      box = Hive.box<Wish>(boxName);
    else if (i == 3)
      box = Hive.box<Profile>(boxName);
    else
      box = Hive.box<Category>(boxName);

    File backupFile = File('${backupDir.path}/$boxName.hive');
    await backupFile.writeAsBytes(boxToBytes(box));
  }
}

Future<Directory> getDownloadDirectory() async {
  if (Platform.isAndroid) {
    return Directory('/storage/emulated/0/Download');
  } else if (Platform.isIOS) {
    return await getApplicationDocumentsDirectory();
  } else {
    throw UnsupportedError('Platform not supported');
  }
}

List<int> boxToBytes(Box box) {
  var bytes = <int>[];
  for (var entry in box.toMap().entries) {
    bytes.addAll(entry.key.toString().codeUnits);
    bytes.addAll(entry.value.toString().codeUnits);
  }
  return bytes;
}

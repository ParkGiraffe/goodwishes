import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 2)
class Profile {
  @HiveField(0)
  dynamic thumbnail;

  @HiveField(1)
  bool isDefault;

  Profile(
    this.thumbnail,
    this.isDefault,
  );
}

class ProfiletProvider with ChangeNotifier {
  late Box<Profile> _profileBox;

  ProfiletProvider() {
    _initBox();
  }

  Future<void> _initBox() async {
    _profileBox = Hive.box<Profile>('profileBox');
    notifyListeners();
  }

  Profile get profile => _profileBox.get('profile')!;

  changeProfile(Uint8List newImage) {
    _profileBox.put('profile', Profile(newImage, false));
    notifyListeners();
  }
}

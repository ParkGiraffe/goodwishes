import 'package:flutter/cupertino.dart';

class CurCategory with ChangeNotifier {
  String curCategory = '';

  void changeCurCategory(String element) {
    curCategory = element;
    notifyListeners(); // 값 변경 후 상태 변경 알림
  }
}

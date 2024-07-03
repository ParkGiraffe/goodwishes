import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:hive/hive.dart';

class WishCategoryListProvider with ChangeNotifier {
  late Box<Category> _wishCategoryListBox;

  WishCategoryListProvider() {
    _initBox();
  }

  Future<void> _initBox() async {
    _wishCategoryListBox = Hive.box<Category>('wishCategoryListBox');
    notifyListeners();
  }

  Iterable<Category> get categoryList => _wishCategoryListBox.values;

  void addCategory(Category element) {
    _wishCategoryListBox.put(element.id, element);
    notifyListeners(); // 값 변경 후 상태 변경 알림
  }

  removeCategory(String id) {
    for (var categoryItem in _wishCategoryListBox.values) {
      if (categoryItem.id == id) {
        // print(categoryItem.count);
        // return false;
        if (categoryItem.count <= 0) {
          _wishCategoryListBox.delete(id);
          notifyListeners();
          return true;
        } else {
          notifyListeners();
          return false;
        }
        // return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }
    }
    notifyListeners();
  }

  void upCountCategory(String categoryName) {
    for (var categoryItem in _wishCategoryListBox.values) {
      if (categoryItem.categoryName == categoryName) {
        categoryItem.count = categoryItem.count + 1;
        _wishCategoryListBox.put(categoryItem.id, categoryItem); // 수정된 값 저장
        return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }
    }
    notifyListeners();
  }

  void downCountCategory(String categoryName) {
    for (var categoryItem in _wishCategoryListBox.values) {
      if (categoryItem.categoryName == categoryName) {
        categoryItem.count = categoryItem.count - 1;
        _wishCategoryListBox.put(categoryItem.id, categoryItem); // 수정된 값 저장
        return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }
    }
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  String id;
  String categoryName;
  int count;

  Category({
    required this.id,
    required this.categoryName,
    required this.count,
  });
}

class CategoryListProvider with ChangeNotifier {
  final List<Category> _categoryList = [
    Category(id: '1', categoryName: '일반', count: 0),
    Category(id: '2', categoryName: '일반2', count: 0),
  ];

  List<Category> get categoryList => _categoryList;

  void addCategory(String element) {
    _categoryList.add(
      Category(
        id: (categoryList.length + 1).toString(),
        categoryName: element,
        count: 0,
      ),
    );
    notifyListeners(); // 값 변경 후 상태 변경 알림
  }

  void removeCategory(String id) {
    for (var categoryItem in _categoryList) {
      if (categoryItem.id == id) {
        if (categoryItem.count != 0) {
          categoryList.remove(categoryItem);
        } else {
          // AlertDialog()
        }
        return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }
    }
    // _categoryList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void upCountCategory(String categoryName) {
    for (var categoryItem in _categoryList) {
      if (categoryItem.categoryName == categoryName) {
        categoryItem.count = categoryItem.count + 1;
        return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }
    }
    // _categoryList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

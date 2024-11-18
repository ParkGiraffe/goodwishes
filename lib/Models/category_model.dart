import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class Category {
  @HiveField(0)
  String id;

  @HiveField(1)
  String categoryName;

  @HiveField(2)
  int count;

  Category({
    required this.id,
    required this.categoryName,
    required this.count,
  });
}

class CategoryListProvider with ChangeNotifier {
  late Box<Category> _categoryListBox;

  CategoryListProvider() {
    _initBox();
  }

  Future<void> _initBox() async {
    _categoryListBox = Hive.box<Category>('categoryListBox');
    notifyListeners();
  }

  Iterable<Category> get categoryList => _categoryListBox.values;

  void addCategory(Category element) {
    _categoryListBox.put(element.id, element);
    notifyListeners(); // 값 변경 후 상태 변경 알림
  }

  removeCategory(String id) {
    for (var categoryItem in _categoryListBox.values) {
      if (categoryItem.id == id) {
        if (categoryItem.count <= 0) {
          _categoryListBox.delete(id);
          notifyListeners();
          return true;
        } else {
          notifyListeners();
          return false;
        }
      }
    }
  }

  void upCountCategory(String categoryName) {
    for (var categoryItem in _categoryListBox.values) {
      if (categoryItem.categoryName == categoryName) {
        categoryItem.count = categoryItem.count + 1;
        _categoryListBox.put(categoryItem.id, categoryItem); // 수정된 값 저장
        return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }
    }
    notifyListeners();
  }

  void downCountCategory(String categoryName) {
    for (var categoryItem in _categoryListBox.values) {
      if (categoryItem.categoryName == categoryName) {
        categoryItem.count = categoryItem.count - 1;
        _categoryListBox.put(categoryItem.id, categoryItem); // 수정된 값 저장
        return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }
    }
    notifyListeners();
  }

  // 카테고리 변경할 때 카운트 이동
  void rewriteCount(String beforeCate, String afterCate) {
    for (var categoryItem in _categoryListBox.values) {
      if (categoryItem.categoryName == beforeCate) {
        categoryItem.count = categoryItem.count - 1;
        _categoryListBox.put(categoryItem.id, categoryItem); // 수정된 값 저장
        return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }

      if (categoryItem.categoryName == afterCate) {
        categoryItem.count = categoryItem.count + 1;
        _categoryListBox.put(categoryItem.id, categoryItem); // 수정된 값 저장
        return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
      }
    }
    notifyListeners();
  }
}

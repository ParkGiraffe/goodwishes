import 'package:flutter/cupertino.dart';

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
    Category(id: '1', categoryName: 'sample', count: 0),
    Category(id: '2', categoryName: 'sample', count: 0),
  ];

  List<Category> get categoryList => _categoryList;

  void addCategory(Category element) {
    _categoryList.add(element);
    notifyListeners(); // 값 변경 후 상태 변경 알림
  }

  void removeCategory(Category element) {
    _categoryList.remove(element);
    notifyListeners();
  }
}

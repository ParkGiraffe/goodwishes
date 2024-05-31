import 'package:flutter/cupertino.dart';

class Category {
  String categoryName;
  int count;

  Category({
    required this.categoryName,
    required this.count,
  });
}

class CategoryListProvider with ChangeNotifier {
  final List<Category> _categoryList = [
    Category(categoryName: 'sample', count: 0),
  ];

  List<Category> get categoryList => _categoryList;
}

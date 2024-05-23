import 'package:flutter/material.dart';

class Goods {
  Image thumbnail;
  String goodsName, date, category, location, wayToBuy, memo;
  int amount, price;
  List<String> tagList;

  Goods({
    required this.thumbnail,
    required this.goodsName,
    required this.date,
    required this.category,
    required this.location,
    required this.wayToBuy,
    required this.memo,
    required this.amount,
    required this.price,
    required this.tagList,
  });
}

class GoodsListProvider with ChangeNotifier {
  final List<Goods> _goodsList = [];
  List<Goods> get goodsList => _goodsList;

  void addGoods(Goods element) {
    _goodsList.add(element);
    notifyListeners(); // 값 변경 후 상태 변경 알림
  }

  void removeGoods(Goods element) {
    _goodsList.remove(element);
    notifyListeners();
  }

  // int _count = 0;

  // void increment() {
  //   _count++;
  //   notifyListeners(); // 값 증가 후 상태 변경 알림
  // }

  // void decrement() {
  //   notifyListeners(); // 값 감소 후 상태 변경 알림
  //   _count--;
  // }
}

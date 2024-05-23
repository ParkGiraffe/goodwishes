import 'package:flutter/material.dart';

class Goods {
  String thumbnail;
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
  final List<Goods> _goodsList = [
    Goods(
        thumbnail: 'assets/goods.jpeg',
        goodsName: 'goodsName',
        date: '2024.xx.xx',
        category: 'category',
        location: 'location',
        wayToBuy: 'wayToBuy',
        memo: 'memo',
        amount: 1,
        price: 10000,
        tagList: ['tagList', 'tagList'])
  ];
  List<Goods> get goodsList => _goodsList;

  void addGoods(Goods element) {
    _goodsList.add(element);
    notifyListeners(); // 값 변경 후 상태 변경 알림
  }

  void removeGoods(Goods element) {
    _goodsList.remove(element);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'goods_model.g.dart';

@HiveType(typeId: 0)
class Goods {
  @HiveField(0)
  String id;

  @HiveField(1)
  String thumbnail;

  @HiveField(2)
  String goodsName;

  @HiveField(3)
  String date;

  @HiveField(4)
  String category;

  @HiveField(5)
  String location;

  @HiveField(6)
  String wayToBuy;

  @HiveField(7)
  String memo;

  @HiveField(8)
  int amount;

  @HiveField(9)
  int price;

  @HiveField(10)
  List<String> tagList;

  @HiveField(11)
  bool isFavorite;

  Goods({
    required this.id,
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
    this.isFavorite = false,
  });
}

class GoodsListProvider with ChangeNotifier {
  /*
  final List<Goods> _goodsList = [
    Goods(
      id: 'dummy',
      thumbnail: 'assets/goods.jpeg',
      goodsName: 'goodsName',
      date: '2024.xx.xx',
      category: 'category',
      location: 'location',
      wayToBuy: 'wayToBuy',
      memo: 'memo',
      amount: 1,
      price: 10000,
      tagList: ['tagList', 'tagList'],
    ),
    Goods(
      id: 'dummy2',
      thumbnail: 'assets/goods.jpeg',
      goodsName: 'dummy',
      date: '2024.xx.xx',
      category: 'categodury',
      location: 'location',
      wayToBuy: 'wayToBuy',
      memo: 'memo',
      amount: 1,
      price: 10000,
      tagList: ['tagList', 'tagList'],
    ),
  ];
  */

  late Box<Goods> _goodsListBox;

  GoodsListProvider() {
    _initBox();
  }

  Future<void> _initBox() async {
    _goodsListBox = Hive.box<Goods>('goodsListBox');
    notifyListeners();
  }

  final List<Goods> _favoriteList = [
    Goods(
        id: 'dummy',
        thumbnail: 'assets/goods.jpeg',
        goodsName: 'goodsName',
        date: '2024.xx.xx',
        category: 'category',
        location: 'location',
        wayToBuy: 'wayToBuy',
        memo: 'memo',
        amount: 1,
        price: 10000,
        tagList: ['tagList', 'tagList']),
    Goods(
        id: 'dummy',
        thumbnail: 'assets/goods.jpeg',
        goodsName: 'goodsName',
        date: '2024.xx.xx',
        category: 'category',
        location: 'location',
        wayToBuy: 'wayToBuy',
        memo: 'memo',
        amount: 1,
        price: 10000,
        tagList: ['tagList', 'tagList']),
    Goods(
        id: 'dummy',
        thumbnail: 'assets/goods.jpeg',
        goodsName: 'goodsName',
        date: '2024.xx.xx',
        category: 'category',
        location: 'location',
        wayToBuy: 'wayToBuy',
        memo: 'memo',
        amount: 1,
        price: 10000,
        tagList: ['tagList', 'tagList']),
  ];

  Iterable<Goods> get goodsList => _goodsListBox.values;
  List<Goods> get favoriteList => _favoriteList;

  void addGoods(Goods element) {
    // _goodsList.add(element);

    _goodsListBox.put(element.id, element);

    notifyListeners(); // 값 변경 후 상태 변경 알림
  }

  void removeGoods(Goods element) {
    // _goodsList.remove(element);
    notifyListeners();
  }

  // 검색 알고리즘
  List<Goods> searchGoods(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return _goodsListBox.values
          .where((goods) =>
              goods.goodsName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

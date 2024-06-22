import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:typed_data';

part 'wish_model.g.dart';

@HiveType(typeId: 3)
class Wish {
  @HiveField(0)
  String id;

  @HiveField(1)
  dynamic thumbnail;

  @HiveField(2)
  String wishName;

  @HiveField(3)
  String date;

  @HiveField(4)
  String category;

  @HiveField(5)
  String location;

  @HiveField(6)
  int wishPrice;

  @HiveField(7)
  String memo;

  @HiveField(8)
  int amount;

  @HiveField(9)
  int rowPrice;

  @HiveField(10)
  List<String> tagList;

  @HiveField(11)
  bool isFavorite;

  Wish({
    required this.id,
    required this.thumbnail,
    required this.wishName,
    required this.date,
    required this.category,
    required this.location,
    required this.wishPrice,
    required this.memo,
    required this.amount,
    required this.rowPrice,
    required this.tagList,
    this.isFavorite = false,
  });

  static Wish createEmptyWish() {
    return Wish(
      id: '',
      thumbnail: Uint8List(0),
      wishName: '',
      date: '',
      category: '',
      location: '',
      memo: '',
      amount: 0,
      rowPrice: 0,
      wishPrice: 0,
      tagList: [],
    );
  }
}

class WishListProvider with ChangeNotifier {
  late Box<Wish> _wishListBox;

  WishListProvider() {
    _initBox();
  }

  Future<void> _initBox() async {
    _wishListBox = Hive.box<Wish>('wishListBox');
    notifyListeners();
  }

  Iterable<Wish> get wishList => _wishListBox.values;
  List<Wish> get favoriteList =>
      _wishListBox.values.where((wish) => wish.isFavorite == true).toList();

  void addWish(Wish element) {
    _wishListBox.put(element.id, element);

    notifyListeners(); // 값 변경 후 상태 변경 알림
  }

  void removeWish(String id) {
    _wishListBox.delete(id);
    notifyListeners();
  }

  // 검색 알고리즘
  List<Wish> searchWish(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return _wishListBox.values
          .where((wish) =>
              wish.wishName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  // 즐겨찾기 등록, 해제
  void updateIsFavorite(String id) {
    Wish? wish = _wishListBox.get(id);
    if (wish != null) {
      wish.isFavorite = !wish.isFavorite;
      _wishListBox.put(id, wish);
      notifyListeners(); // 값 변경 후 상태 변경 알림
    }
  }

  // 카테고리 검색 알고리즘
  List<Wish> getCategoryWish(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return _wishListBox.values
          .where((wish) =>
              wish.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/my_item.dart';

class ShopProvider extends ChangeNotifier {
  List<MyItem> myItems = [
    MyItem(
      name: "Test",
      price: 100000,
      imgPath: "images/space.png",
    ),
  ];
  List<MyItem> myCart = [];

  void AddItemToCart(MyItem item) {
    myCart.add(item);
    log("current cart: $myCart");
    // notifyListeners();
  }

  void RemoveItemFromCart(MyItem item) {
    myCart.remove(item);
    log("current cart: $myCart");
    notifyListeners();
  }
}

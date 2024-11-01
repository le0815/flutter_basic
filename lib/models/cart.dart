import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeTotals = [
    Shoe(
        name: "Air Jordan 1",
        price: 1230000,
        imgPath: "images/AIR_JORDAN_1.png"),
    Shoe(name: "Air Pegasus", price: 500000, imgPath: "images/AIR_PEGASUS.png"),
    Shoe(
        name: "V2K Run GTX", price: 1230000, imgPath: "images/V2K_RUN_GTX.png"),
    Shoe(
        name: "Zoom Vomero Roam",
        price: 500000,
        imgPath: "images/ZOOM_VOMERO_ROAM.png"),
  ];

  List<Shoe> userCart = [];

  List<Shoe> GetShoeList() {
    return shoeTotals;
  }

  List<Shoe> GetUSerCart() {
    log("Current cart items: $userCart");
    return userCart;
  }

  void AddShoeToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
    log("Current cart items: $userCart");
  }

  void RemoveShoeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
    log("Current cart items: $userCart");
  }
}

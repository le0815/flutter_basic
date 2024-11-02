import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> myCart = [];

  List<Shoe> GetCart() {
    return myCart;
  }

  void AddToCart(Shoe shoe) {
    myCart.add(shoe);
    log("Current card: $myCart");
    notifyListeners();
  }

  void RemoveFromCart(Shoe shoe) {
    myCart.remove(shoe);
    log("Current card: $myCart");
    notifyListeners();
  }
}

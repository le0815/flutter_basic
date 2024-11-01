import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/cart.dart';
import 'package:flutter_application_3/models/shoe.dart';
import 'package:flutter_application_3/utils/cart_tile.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Column(
            children: [
              const Text(
                "My Cart",
                style: TextStyle(fontSize: 28),
              ),
              ListView.builder(
                itemCount: value.GetUSerCart().length,
                itemBuilder: (context, index) {
                  Shoe shoe = value.GetUSerCart()[index];
                  return CartTile(shoe: shoe);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

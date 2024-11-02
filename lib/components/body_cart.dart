import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/cart.dart';
import 'package:flutter_application_3/ultis/cart_tile.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_application_3/utils/cart_tile.dart';

class BodyCart extends StatelessWidget {
  const BodyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Consumer<Cart>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.GetCart().length,
            itemBuilder: (context, index) {
              return CartTile(
                shoe: value.GetCart()[index],
                onRemove: () => value.RemoveFromCart(value.GetCart()[index]),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/my_item.dart';
import 'package:flutter_application_4/pages/home_page.dart';
import 'package:flutter_application_4/ultis/my_cart_item.dart';
import 'package:flutter_application_4/ultis/my_drawer.dart';
import 'package:flutter_application_4/ultis/shop_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myCart = context.watch<ShopProvider>().myCart;

    void RemoveItemFromCart(MyItem item) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Are you sure want to delete this item?"),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text("No"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<ShopProvider>().RemoveItemFromCart(item);
              },
              child: Text("Yes"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart Page"),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "/home_page"),
              icon: Icon(Icons.home),
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: ListView.builder(
          itemCount: myCart.length,
          itemBuilder: (context, index) {
            return MyCartItem(
              item: myCart[index],
              onPressed: () => RemoveItemFromCart(myCart[index]),
            );
          },
        ));
  }
}

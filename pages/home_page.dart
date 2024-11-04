import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/main.dart';
import 'package:flutter_application_4/models/my_item.dart';
import 'package:flutter_application_4/ultis/my_drawer.dart';
import 'package:flutter_application_4/ultis/my_item_tile.dart';
import 'package:flutter_application_4/ultis/shop_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void AddItemToCart(BuildContext context, MyItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Add this item to your cart?"),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text("No"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<ShopProvider>().AddItemToCart(item);
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = context.read<ShopProvider>().myItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/cart_page"),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Text("Let's pick some special for U ❤️"),
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return MyItemTile(
                  onTap: () => AddItemToCart(context, items[index]),
                  item: items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

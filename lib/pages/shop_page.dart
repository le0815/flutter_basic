import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/cart.dart';
import 'package:flutter_application_3/models/shoe.dart';

import 'package:flutter_application_3/utils/shoe_tile.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void AddItemToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).AddShoeToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Yay 💥💥"),
        content: Text("Your shoe was successfully added to your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(56, 0, 0, 0),
                borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text("Search"),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Text
        const Text(
          "Hot picks ❤️‍🔥",
          style: TextStyle(fontSize: 28),
        ),
        Expanded(child: Consumer<Cart>(
          builder: (context, value, child) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.GetShoeList().length,
              itemBuilder: (context, index) {
                Shoe shoe = value.GetShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => AddItemToCart(shoe),
                );
              },
            );
          },
        ))
      ],
    );
  }
}

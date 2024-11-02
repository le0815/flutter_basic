import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/cart.dart';
import 'package:flutter_application_3/models/shoe.dart';
import 'package:flutter_application_3/ultis/shop_tile.dart';
import 'package:provider/provider.dart';

class BodyHome extends StatelessWidget {
  final List<Shoe> shoeList = const [
    Shoe(
        nameShoe: "Air Jordan",
        imgPathShoe: "images/AIR_JORDAN_1.png",
        priceShoe: 4000000),
    Shoe(
        nameShoe: "Air Pegasus",
        imgPathShoe: "images/AIR_PEGASUS.png",
        priceShoe: 300000),
    Shoe(
        nameShoe: "V2K Run GTX",
        imgPathShoe: "images/V2K_RUN_GTX.png",
        priceShoe: 5500000),
    Shoe(
        nameShoe: "Zoom Vomero Roam",
        imgPathShoe: "images/ZOOM_VOMERO_ROAM.png",
        priceShoe: 9000000),
  ];

  const BodyHome({super.key});

  void AddShoeToCart(Shoe shoe, BuildContext context) {
    Provider.of<Cart>(context, listen: false).AddToCart(shoe);
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Yay ❤️‍🔥❤️‍🔥"),
          content: Text("Your shoe was successfully added to your cart!"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black38)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 40),
            child: Text(
              "Hot Picks 🔥",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: Consumer<Cart>(
              builder: (context, value, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoeList.length,
                  itemBuilder: (context, index) {
                    return ShopTile(
                      shoe: shoeList[index],
                      onTap: () => AddShoeToCart(shoeList[index], context),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

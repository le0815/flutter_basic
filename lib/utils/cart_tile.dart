import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/shoe.dart';
import 'package:slideable/slideable.dart';

class CartTile extends StatelessWidget {
  Shoe shoe;

  CartTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Slideable(
      items: [
        ActionItems(
          icon: const Icon(Icons.delete),
          onPress: () {},
          backgroudColor: Colors.transparent,
        )
      ],
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFE0E0E0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Expanded(
              //   flex: 3,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(12),
              //     child: Image.asset(
              //       shoe.imgPath,
              //       // width: 80,
              //       fit: BoxFit.cover, // Ensure the image covers the container
              //     ),
              //   ),
              // ),
              Expanded(
                flex: 5,
                child: Text(shoe.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

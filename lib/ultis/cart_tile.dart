import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/shoe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slideable/slideable.dart';

class CartTile extends StatelessWidget {
  Shoe shoe;
  Function() onRemove;
  CartTile({super.key, required this.shoe, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Slideable(
      items: [
        ActionItems(
          icon: Icon(Icons.delete),
          onPress: onRemove,
          backgroudColor: Colors.transparent,
        )
      ],
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: 100,
          padding: EdgeInsets.all(8),
          // width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(
              255,
              193,
              189,
              189,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  shoe.imgPathShoe,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Text(shoe.nameShoe),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/shoe.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 75, top: 30),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(247, 247, 247, 247),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // display shoe image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                shoe.imgPath,
                height: 350,
              ),
            ),
            // display description
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // description for item
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: TextStyle(fontSize: 28),
                      ),
                      Text("${shoe.price} VND")
                    ],
                  ),
                ),
                // add item
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

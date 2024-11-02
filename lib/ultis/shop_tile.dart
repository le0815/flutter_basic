import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/shoe.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShopTile extends StatelessWidget {
  final Shoe shoe;
  final Function()? onTap;
  const ShopTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        width: 300,
        height: 450,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 1,
            ),
            // image of shoe
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                shoe.imgPathShoe,
                width: 250,
              ),
            ),
            // information of shoe, '+' button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.nameShoe,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      Text("${shoe.priceShoe} VND"),
                    ],
                  ),
                ),
                // 'add' button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
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

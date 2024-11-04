import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/my_item.dart';

class MyItemTile extends StatelessWidget {
  final Function()? onTap;
  final MyItem item;

  const MyItemTile({
    super.key,
    required this.onTap,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 330,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.imgPath,
                    width: 300,
                    height: 350,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.price.toString()),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

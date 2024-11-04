import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag,
              size: 82,
              color: Colors.black54,
            ),
            const SizedBox(height: 30),
            const Text(
              "Minimal Shop",
              style: TextStyle(),
            ),
            const SizedBox(height: 10),
            const Text(
              "Premium Quality Product",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),
            // button
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/home_page"),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

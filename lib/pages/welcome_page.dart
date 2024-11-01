import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                "images/nike_logo.png",
                height: 500,
                width: 300,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
                child: const Text(
                  "Just Do It",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

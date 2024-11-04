import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/cart_page.dart';
import 'package:flutter_application_4/pages/home_page.dart';
import 'package:flutter_application_4/pages/intro_page.dart';
import 'package:flutter_application_4/ultis/shop_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopProvider(),
      child: MaterialApp(
        home: const IntroPage(),
        routes: {
          "/home_page": (context) => const HomePage(),
          "/intro_page": (context) => const IntroPage(),
          "/cart_page": (context) => const CartPage(),
        },
      ),
    );
  }
}

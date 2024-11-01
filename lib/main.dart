import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/cart.dart';
import 'package:flutter_application_3/pages/welcome_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: WelcomePage(),
      ),
    );
  }
}

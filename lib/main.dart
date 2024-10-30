import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  log("app start");
  await Hive.initFlutter();

  final _localDatabase = await Hive.openBox("MyDatabase");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

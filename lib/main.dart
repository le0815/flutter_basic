import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_5/pages/auth_page.dart';
import 'firebase_options.dart';
import 'package:flutter_application_5/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
        // textTheme: GoogleFonts.lobsterTextTheme(Theme.of(context).textTheme),
      ),
      home: AuthPage(),
    );
  }
}

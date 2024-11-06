import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/login_page.dart';
import 'package:flutter_application_5/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  bool loginPage = true;
  LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  void TogglePage() {
    setState(() {
      widget.loginPage = !widget.loginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.loginPage == true
        ? LoginPage(
            onRegister: TogglePage,
            onLoginWithGoogle: () {},
          )
        : RegisterPage(onLogin: TogglePage);
  }
}

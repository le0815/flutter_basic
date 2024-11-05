import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usrNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  void UserSignIn() async {
    //progress bar
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usrNameController.text,
        password: pwdController.text,
      );
      log("Logged in");
    } on FirebaseAuthException catch (e) {
      // if user input wrong usrname or pwd
      if (e.code == "invalid-credential") {
        log("err login code 1: ${e.code}");
        // close the progress bar
        if (context.mounted) {
          Navigator.of(context).pop();
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Wrong email or password"),
            content: const Text("Please check your input!"),
            actions: [
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"))
            ],
          ),
        );
      } else {
        log("err login code 2: ${e.code}");
        // close the progress bar
        if (context.mounted) {
          Navigator.pop(context);
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Unexpected error"),
            content: const Text("Please contact to Administrator!"),
            actions: [
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"))
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.login,
                color: Colors.white,
                size: 64,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Come back, you've been missed!"),
              const SizedBox(
                height: 50,
              ),
              // userName textfield
              MyTextfield(
                controller: usrNameController,
                hintText: "User Name",
                hindText: false,
              ),
              const SizedBox(
                height: 25,
              ),
              // pwd textfield
              MyTextfield(
                controller: pwdController,
                hintText: "Password",
                hindText: true,
              ),
              // forgot pwd
              const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot password?"),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              // sign in btn
              GestureDetector(
                onTap: UserSignIn,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //sign in with
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Text(" Or continue with "),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

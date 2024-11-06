import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/my_circle_progressbar.dart';
import 'package:flutter_application_5/components/my_err_dialog.dart';
import 'package:flutter_application_5/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onRegister;
  final Function()? onLoginWithGoogle;
  const LoginPage({
    super.key,
    required this.onRegister,
    required this.onLoginWithGoogle,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usrNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  void UserSignIn() async {
    //progress bar
    MyCircleProgressBar(context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usrNameController.text,
        password: pwdController.text,
      );
      log("Logged in");

      // close the progress bar
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // close the progress bar
      Navigator.pop(context);

      //show err
      MyErrDialog(msg: e.code, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onLoginWithGoogle,
                      child: const Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onRegister,
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

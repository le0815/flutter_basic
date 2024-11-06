import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/my_circle_progressbar.dart';
import 'package:flutter_application_5/components/my_err_dialog.dart';
import 'package:flutter_application_5/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onLogin;
  const RegisterPage({super.key, required this.onLogin});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usrNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  void UserSignUp() async {
    // check if pwd is match
    if (pwdController.text != confirmPwdController.text) {
      // show err
      log("pwd do not match");
      return MyErrDialog(msg: "Your password do not match!", context: context);
    }

    //progress bar
    MyCircleProgressBar(context);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
                const Text("Good to see you, my new friend!"),
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
                const SizedBox(
                  height: 25,
                ),
                // confirm pwd textfield
                MyTextfield(
                  controller: confirmPwdController,
                  hintText: "Confirm Password",
                  hindText: true,
                ),

                const SizedBox(
                  height: 18,
                ),
                // sign up btn
                GestureDetector(
                  onTap: UserSignUp,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
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
                    Text(" Already have an account? "),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: widget.onLogin,
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

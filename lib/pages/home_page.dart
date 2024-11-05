import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                log("Logged out");
              },
              icon: Icon(
                Icons.logout,
              ),
            ),
          ],
        ),
        body: Center(child: Text("Logged in!\nHello: ${currentUser?.email}")),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hindText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hindText,
    required this.hintText,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
        ),
        obscureText: widget.hindText,
      ),
    );
  }
}

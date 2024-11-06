import 'package:flutter/material.dart';

void MyErrDialog({required String msg, required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Error"),
      content: Text(msg),
      actions: [
        OutlinedButton(
            onPressed: () => Navigator.pop(context), child: const Text("Close"))
      ],
    ),
  );
}

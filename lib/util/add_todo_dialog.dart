import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback? onSave;
  VoidCallback? onBack;

  AddTodoDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onBack});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[100],
      content: Container(
        // width: 50,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Create a new note",
                  filled: true),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onBack,
                  child: const Text('Back'),
                ),
                TextButton(
                  onPressed: onSave,
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

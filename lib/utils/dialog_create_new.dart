import 'package:flutter/material.dart';

class DialogCreateNew extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onBack;

  const DialogCreateNew({
    super.key,
    required this.onSave,
    required this.onBack,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onBack,
                  child: const Text("Back"),
                ),
                TextButton(
                  onPressed: onSave,
                  child: const Text("Save"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

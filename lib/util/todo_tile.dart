import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool completed;
  final String name;
  Function(bool?)? onChanged;

  TodoTile({
    super.key,
    required this.name,
    required this.completed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //checkbox
            Checkbox(
              value: completed,
              onChanged: onChanged,
              hoverColor: Colors.green[400],
            ),
            // todo name
            Text(
              name,
              style: TextStyle(
                decoration: completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

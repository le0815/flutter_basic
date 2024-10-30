import 'package:flutter/material.dart';
import 'package:slideable/slideable.dart';

class TodoTile extends StatelessWidget {
  final bool completed;
  final String name;
  Function(bool?)? onChanged;
  VoidCallback onRemove;

  TodoTile({
    super.key,
    required this.name,
    required this.completed,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      child: Slideable(
        resetSlide: true,
        items: [
          ActionItems(
            icon: const Icon(
              Icons.delete,
              // color: Colors.red[400],
            ),
            onPress: onRemove,
            backgroudColor: const Color.fromARGB(255, 223, 80, 70),
            radius: BorderRadius.circular(12),
          ),
        ],
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
                  overflow: TextOverflow.ellipsis,
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

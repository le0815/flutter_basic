import 'package:flutter/material.dart';
import 'package:slideable/slideable.dart';

class TodoTile extends StatelessWidget {
  final bool checkState;
  final Function(bool?)? onChanged;
  final VoidCallback onRemove;
  final String text;

  const TodoTile({
    super.key,
    required this.checkState,
    required this.onChanged,
    required this.text,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Slideable(
        items: [
          ActionItems(
            backgroudColor: Colors.transparent,
            icon: Icon(Icons.delete),
            onPress: onRemove,
          ),
        ],
        child: Card(
          color: Colors.blue[300],
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Checkbox(value: checkState, onChanged: onChanged),
                ),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      // if check box checked => line through the text
                      decoration: checkState
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

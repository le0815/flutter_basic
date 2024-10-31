import 'package:flutter/material.dart';
import 'package:flutter_application_3/database/local_database.dart';
import 'package:flutter_application_3/utils/dialog_create_new.dart';
import 'package:flutter_application_3/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  LocalDatabase db = LocalDatabase();

  @override
  void initState() {
    // TODO: implement initState
    db.LoadDatabase();
    super.initState();
  }

  void ChangeState(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.UpdateDatabase();
  }

  void SaveTodo() {
    String text = controller.text;
    if (text.isNotEmpty) {
      setState(() {
        db.toDoList.add([text, false]);
      });
    }
    db.UpdateDatabase();
    controller.clear();
    Navigator.of(context).pop();
  }

  void RemoveTodo(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.UpdateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        backgroundColor: Colors.blue[400],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogCreateNew(
                  controller: controller,
                  onBack: () => Navigator.of(context).pop(),
                  onSave: SaveTodo,
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            checkState: db.toDoList[index][1],
            text: db.toDoList[index][0],
            onChanged: (value) => ChangeState(value, index),
            onRemove: () => RemoveTodo(index),
          );
        },
      ),
    );
  }
}

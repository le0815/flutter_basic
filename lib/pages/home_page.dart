import 'package:flutter/material.dart';
import 'package:flutter_application_3/util/add_todo_dialog.dart';
import 'package:flutter_application_3/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["aiijkfd", false],
    ["asfdasdf", true],
    ['6930', true],
  ];

  void CheckBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void CreateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddTodoDialog(
          controller: _controller,
          onBack: () => Navigator.of(context).pop(),
          onSave: SaveTask,
        );
      },
    );
  }

  void SaveTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    //back to homescreen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("My Todo"),
        backgroundColor: Colors.blue[400],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CreateNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            name: toDoList[index][0],
            completed: toDoList[index][1],
            onChanged: (d) => CheckBoxChange(d, index),
          );
        },
      ),
    );
  }
}

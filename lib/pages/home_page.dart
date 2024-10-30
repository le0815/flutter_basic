import 'package:flutter/material.dart';
import 'package:flutter_application_3/database/local_database.dart';
import 'package:flutter_application_3/util/add_todo_dialog.dart';
import 'package:flutter_application_3/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  LocalDataBase db = LocalDataBase();

  @override
  void initState() {
    // TODO: implement initState
    db.LoadData();
    super.initState();
  }

  void CheckBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.UpdateData();
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
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    //back to homescreen
    Navigator.of(context).pop();
    db.UpdateData();
  }

  void RemoveTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.UpdateData();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            name: db.toDoList[index][0],
            completed: db.toDoList[index][1],
            onChanged: (value) => CheckBoxChange(value, index),
            onRemove: () => RemoveTask(index),
          );
        },
      ),
    );
  }
}

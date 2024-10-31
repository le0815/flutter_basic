// import 'dart:math';
import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataBase {
  List toDoList = [];
  final String _boxname = "ToDoList";

  final myBox = Hive.box('MyDatabase');

  void LoadData() {
    log("database: ${myBox.get(_boxname)}");
    toDoList = myBox.get(_boxname) ?? [];
  }

  void UpdateData() {
    myBox.put(_boxname, toDoList);
    log("updated database: ${myBox.get(_boxname)}");
  }
}

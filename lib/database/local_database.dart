import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabase {
  List toDoList = [];
  final List initList = [
    ["It's seem have not any to do here", false],
    ["Create new ones", false],
  ];

  final String databaseKey = "ToDo";
  // final localDatabase = Hive.openBox("ToDoDataBase");

  var myDatabase = Hive.box("ToDoDataBase");

  void LoadDatabase() {
    log("loading database: ${myDatabase.get(databaseKey)}");
    toDoList = myDatabase.get(databaseKey) ?? initList;
  }

  void UpdateDatabase() {
    myDatabase.put(databaseKey, toDoList);
    log("putting data to database");
    log("data put: $toDoList");
    log('database: ${myDatabase.get(databaseKey)}');
  }
}

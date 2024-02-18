import 'package:hive_flutter/hive_flutter.dart';

class toDoDataBase {
  // list of to-do tasks
  List toDoList = [];

  //reference our box
  final _myBox = Hive.box('mybox');

  // run this app for the first time ever
  void createInitialData() {
    toDoList = [
      ["Add your first Task", false],
    ];
  }

  //load the data from the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

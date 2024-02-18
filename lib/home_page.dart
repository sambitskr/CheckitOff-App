import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/util/Todo_tiles.dart';
import 'package:to_do_list/util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  toDoDataBase db = toDoDataBase();
  @override
  void initState() {
    //if this is the first time ever opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there alredy exist data
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  // check box was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void saveNewTask() {
    setState(
      () {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      },
    );
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text('CheckIt Off'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        // child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'All To Do',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: db.toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoTile(
                    taskName: db.toDoList[index][0],
                    taskCompleted: db.toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) => deleteTask(index),
                  );
                },
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}

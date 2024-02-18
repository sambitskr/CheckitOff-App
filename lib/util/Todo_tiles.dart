import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            icon: Icons.delete,
            onPressed: deleteFunction,
            backgroundColor: Colors.red.shade400,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //checkbox
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.black),
                child: Checkbox(
                  focusColor: Colors.black,
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
              ),

              Text(
                taskName,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow[100],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

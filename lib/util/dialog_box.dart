import 'package:flutter/material.dart';
import 'package:to_do_list/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.email_rounded,
                  color: Colors.black,
                  size: 12.84,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Add New Task",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ],
            ),
            // get user input
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(isDense: true),
            ),
            // TextField(
            //   style: TextStyle(color: Colors.black),
            //   controller: controller,
            //   decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.black),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       hintText: "Add a new Task",
            //       hintStyle: TextStyle(color: Colors.black)),
            // ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(
                  text: "Add",
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 9,
                ),

                // cancel button
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

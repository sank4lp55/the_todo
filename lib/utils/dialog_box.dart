import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'my_button.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 450,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //get user input
            TextField(
              controller: controller,
              maxLines: 15, // Allows up to 10 lines
              decoration: InputDecoration(
                hintText: 'Enter text here...',
                border: InputBorder.none, // Removes all borders
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: () => onSave(),
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: () => onCancel(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controllers/manager_controller.dart';
import '../utils/fade_in_button.dart';

class TaskScreen extends StatefulWidget {
  final String task;
  final String date;
  final String? description;
  final Color? color;
  final int index;

  const TaskScreen({
    super.key,
    required this.task,
    required this.date,
    this.description,
    this.color,
    required this.index,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return AlertDialog(
      backgroundColor: widget.color,
      contentPadding: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Adjust the radius here
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Take as much space as needed
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image in the top left
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (widget.index < todoProvider.toDoList.length &&
                      todoProvider.toDoList[widget.index][2])
                      ? Image.asset(
                    'lib/images/accept.png', // Path to your image
                    height: 25, // Adjust height as needed
                  )
                      : const SizedBox.shrink(),
                ),
                // Close icon in the top right
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,5),
              child: Text(
                widget.task,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "Deadline: ${widget.date}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
             SizedBox(
              height: 200, // Set a fixed height for the text area
              child: Scrollbar(
                thumbVisibility: true, // Make the scrollbar always visible
                thickness: 4, // Adjust thickness for the scrollbar thumb
                radius: Radius.circular(8), // Make the thumb rounded (optional)
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      widget.description??"",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      maxLines: 8, // Limit to 8 lines
                      overflow: TextOverflow.ellipsis, // Add ellipsis if overflowed
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            FadeInButtonDemo(
              titleColor: widget.color==Colors.grey? Colors.black:Colors.white,
              buttonColor:widget.color==Colors.grey? Colors.white70:Colors.grey,
              borderColor:widget.color==Colors.grey? Colors.white70:Colors.grey,
              isVisible: true,
              title: (widget.index < todoProvider.toDoList.length &&
                  todoProvider.toDoList[widget.index][2])
                  ? 'Not Done'
                  : 'Done',
              onTap: () {
                todoProvider.checkBoxTapped(index: widget.index);
                Fluttertoast.showToast(msg: "Updated the task status!");
              },
            ),
            const SizedBox(height: 10),
            FadeInButtonDemo(
              buttonColor: Colors.transparent,
              borderColor:widget.color==Colors.grey? Colors.white70:Colors.grey,

              isVisible: true,
              title: "Delete",
              onTap: () {
                if (widget.index < todoProvider.toDoList.length) {
                  todoProvider.deleteTask(widget.index); // Delete task first
                }
                Fluttertoast.showToast(msg: "Deleted the task!");
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}

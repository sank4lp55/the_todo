import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controllers/manager_controller.dart';

class TaskScreen extends StatefulWidget {
  final String task;
  final String date;
  final Color? color;
  final int index;

  const TaskScreen({
    super.key,
    required this.task,
    required this.date,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: widget.color ?? Colors.white, // Fallback to white if no color is provided
      content: Container(
        height: 450,
        width: double.maxFinite, // Make the container full width
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image in the top left
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (widget.index < todoProvider.toDoList.length && todoProvider.toDoList[widget.index][1])?Image.asset(
                    'lib/images/accept.png', // Path to your image
                    height: 25, // Adjust height as needed
                  ):SizedBox.shrink(),
                ),
                // Close icon in the top right
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black), // Close icon
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                widget.task,
                style: TextStyle(
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
                widget.date,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(), // Pushes the buttons to the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0), // Button padding
                  ),
                  onPressed: () {
                    todoProvider.checkBoxTapped(index: widget.index);
                    Fluttertoast.showToast(msg:"Updated the task status!");
                  },
                  child: Text(
                    (widget.index < todoProvider.toDoList.length && todoProvider.toDoList[widget.index][1])?'Not Done':'Done',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 14.0, // Text size
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0), // Button padding
                  ),
                  onPressed: () {
                    if (widget.index < todoProvider.toDoList.length) {
                      todoProvider.deleteTask(widget.index); // Delete task first
                    }
                    Fluttertoast.showToast(msg:"Deleted the task!");
                    Navigator.of(context).pop(); // Close the dialog
                  },

                  child: Row(
                    mainAxisSize: MainAxisSize.min, // To fit the icon and text
                    children: [
                      Icon(Icons.delete, color: Colors.white), // Delete icon
                      SizedBox(width: 5), // Space between icon and text
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 14.0, // Text size
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

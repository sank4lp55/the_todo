import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo/components/task_screen.dart';

import '../controllers/manager_controller.dart';

class TaskGrid extends StatelessWidget {
  final int index; // Declare index as a final variable
  final String heading;
  final String date;

  const TaskGrid({
    super.key,
    required this.index,
    required this.heading,
    required this.date,
  }); // Accept index in the constructor

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    TextEditingController controller = TextEditingController();

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return TaskScreen(
              task: heading,
              date: date,
              color: index == 0
                  ? Color(0xffE0E541)
                  : (index % 3 == 0)
                  ? Colors.grey
                  : Colors.grey[200],
              index: index,
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: index == 0
              ? Color(0xffE0E541)
              : (index % 3 == 0)
              ? Colors.grey[400]
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            // Main content of the TaskGrid (heading, date, etc.)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task heading
                Text(
                  heading,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 8),
                // Task date
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 12),
                // Circular image
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "lib/images/apiens_1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            // PNG image in the top-right corner (optional based on condition)
            Positioned(
              top: 5,
              right: 5,
              child: (index < todoProvider.toDoList.length &&
                  todoProvider.toDoList[index][1])
                  ? Image.asset(
                'lib/images/accept.png',
                height: 15,
              )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

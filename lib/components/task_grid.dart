import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo/components/task_screen.dart';

import '../controllers/manager_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskGrid extends StatelessWidget {
  final int index; // Declare index as a final variable
  final String heading;
  final String date;
  final String? priority;
  final String? description;

  const TaskGrid({
    super.key,
    required this.index,
    required this.heading,
    required this.date,
    this.priority,
    this.description,
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
              description: description,
              color: index == 0
                  ?  Colors.grey
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
              ? Colors.grey
              : (index % 3 == 0)
              ? Colors.grey[400]
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
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

                SizedBox(height: 8),
                // Task date
                Text(
                  "Priority: ${priority}",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12),
                // Circular image

              ],
            ),
            // PNG image in the top-right corner (optional based on condition)
            Positioned(
              top: 5,
              right: 0,
              child: (index < todoProvider.toDoList.length &&
                  todoProvider.toDoList[index][2])
                  ? Image.asset(
                'lib/images/accept.png',
                height: 15,
              )
                  : SizedBox.shrink(),
            ),
            Positioned(
              top: 5,
              left: 0,
              child:    Text(
                date,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../components/task_grid.dart';
import '../controllers/manager_controller.dart';

class RecentTab extends StatelessWidget {
  const RecentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff1C1C1C),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 2 / 2.5, // Aspect ratio for each grid item
          ),
          itemCount: todoProvider.toDoList.length,
          itemBuilder: (context, index) {
            return TaskGrid(
              index: index,
              heading: todoProvider.toDoList[index][0],
              description: todoProvider.toDoList[index][1],
              date: todoProvider.toDoList[index][3],
              priority: todoProvider.toDoList[index][4],
            );
          },
        ),
      ),
    ));
  }
}

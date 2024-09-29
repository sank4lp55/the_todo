import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo/components/profile_dialog.dart';

import '../controllers/auth_controller.dart';
import '../controllers/manager_controller.dart';
import '../input_task_screen.dart';

class MyBottomBar extends StatelessWidget {
  final int index;
  final Function(int?) onTap;

  MyBottomBar({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final authController = Provider.of<AuthController>(context);
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (selectedIndex) {
        if (selectedIndex == 1) {
          print("Center icon tapped");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InputTaskScreen()),
          );

        }
        else if (selectedIndex == 2) {
          print("Right icon tapped");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ProfileDialog(
                avatarImagePath: authController.user.avatar!,
                name: authController.user.name!,
              );
            },
          );

        } else {
          onTap(selectedIndex);
        }
      },
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: _buildIconWithBackground(
            icon: Icons.home,
            isSelected: index == 0,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIconWithBackground(
            icon: Icons.add,
            isSelected: index == 1,
          ),
          label: 'Add',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  // Helper method to build an icon with a circular background
  Widget _buildIconWithBackground({required IconData icon, required bool isSelected}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Circular background
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
           color:  Colors.grey.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
        ),
        // Icon on top of the circular background
        Icon(
          icon,
          color: Colors.white,
        ),
      ],
    );
  }
}

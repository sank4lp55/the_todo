import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:the_todo/components/profile_dialog.dart';

import '../controllers/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // For formatting date and time

class MyAppBar extends StatelessWidget {
  final String title;
  VoidCallback onSearchTap;

  MyAppBar({
    Key? key,
    required this.onSearchTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String greetingMessage = "";
    String formattedDateTime = "";
    final authController = Provider.of<AuthController>(context);

    void _setGreetingMessage() {
      var currentTime = DateTime.now();
      var hour = currentTime.hour;

      if (hour < 12) {
        greetingMessage = "Good Morning";
      } else if (hour < 17) {
        greetingMessage = "Good Afternoon";
      } else {
        greetingMessage = "Good Evening";
      }
    }
    _setGreetingMessage();

    void _setFormattedDateTime() {
      var now = DateTime.now();

      // Format the time as hh:mm AM/PM
      String formattedTime = DateFormat('hh:mm a').format(now);

      // Format the date as dd MMM, yy (e.g., 24 Sept, 24)
      String formattedDate = DateFormat('dd MMM, yy').format(now);

      // Combine time and date into a single string
      formattedDateTime = "$formattedTime, $formattedDate";
    }

    _setFormattedDateTime();

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$greetingMessage,\n${authController.user.name}!",
            style: GoogleFonts.roboto(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        SizedBox(height: 5,),
        Text(
          formattedDateTime,
          style: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white70, // Slightly lighter text for date/time
          ),
        ),
      ],
    ),

          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProfileDialog(
                    avatarImagePath: authController.user.avatar!,
                    name: authController.user.name!,
                  );
                },
              );
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey[200]!,
                  // Adding the grey ring around the image
                  width: 1.0, // You can adjust the width as needed
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  authController.user.avatar!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )

          // GestureDetector(
          //   onTap: onSearchTap,
          //   child: Container(
          //     padding: EdgeInsets.all(12),
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.white),
          //       borderRadius: BorderRadius.circular(16),
          //       color: Colors.grey[200],
          //     ),
          //     child: Icon(
          //       Icons.search,
          //       size: 36,
          //       color: Colors.grey[800],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

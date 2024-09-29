import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';
import 'package:provider/provider.dart';

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
    final authController = Provider.of<AuthController>(context);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Good Morning,\n${authController.user.name}!",
              style: GoogleFonts.roboto(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[200]!, // Adding the grey ring around the image
                width: 1.0, // You can adjust the width as needed
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                authController.user.avatar!,
                fit: BoxFit.cover,
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

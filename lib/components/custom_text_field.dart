import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller; // Controller to manage the text input
  final Function(String) onTextChanged; // Callback function to execute
  final String hintText; // Custom hint text
  final int maxLines; // Maximum number of lines

  CustomTextField({
    Key? key,
    required this.controller,
    required this.onTextChanged,
    this.hintText = "Enter text",
    this.maxLines = 1, // Default to 1 line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextField(
        controller: controller,
        onChanged: (text) {
          onTextChanged(text); // Execute the provided function
        },
        maxLines: maxLines, // Allow multiple lines
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.white54,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white70),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white70, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white70, width: 2),
          ),
        ),
        style: GoogleFonts.montserrat(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        keyboardType: TextInputType.multiline, // Specify multi-line input
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onTextChanged; // Callback function to execute
  final String hintText; // Custom hint text

  CustomTextField({
    Key? key,
    required this.onTextChanged,
    this.hintText = "Enter text",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextField(
        onChanged: (text) {


            onTextChanged(text); // Execute the provided function if text is not empty

        },
        decoration: InputDecoration(
          hintText: hintText, // Use the custom hint text
          hintStyle: GoogleFonts.montserrat(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.white54, // Color for hint text
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Padding inside the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white70), // Color of the border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white70, width: 1), // Border when enabled
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white70, width: 2), // Border when focused
          ),
        ),
        style: GoogleFonts.montserrat(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Colors.white, // Text color
        ),
        cursorColor: Colors.white, // Cursor color
      ),
    );
  }
}

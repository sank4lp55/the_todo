import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../name_screen.dart';


class ProfileDialog extends StatefulWidget {
  final String avatarImagePath;
  final String name;

  const ProfileDialog({
    super.key,
    required this.avatarImagePath,
    required this.name,
  });

  @override
  State<ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Adjust the radius here
      ),
      content: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min, // Take as much space as needed
              children: [
                Container(
                  width: w - 20,
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
                      widget.avatarImagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Adding some space between avatar and text
                Container(
                  child: Text(
                    widget.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            // Positioned edit icon
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.edit_rounded, color: Colors.black),
                onPressed: () {
                  // Navigate to NameScreen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NameScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

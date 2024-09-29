import 'package:flutter/material.dart';
import 'package:the_todo/name_screen.dart';
import 'dart:async';

import 'homescreen.dart'; // For the Timer class
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../data/database.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //reference the hive box
  final _myBox = Hive.box("myBox");

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3 seconds
    Timer(Duration(seconds: 2), () {
      if (_myBox.get("USER") == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NameScreen()),
        );
      } else {
        //already exist data
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Homescreen()),
        );
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your logo
            Container(
              width: 150,
              // height: 100
              decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  // color: Colors.white,
                  ),
              child: Container(
                child: Image.asset(
                  "lib/images/img_7.png",
                  fit: BoxFit.cover,
                  width: 100, // Set your desired width
                  // height: 100, // Set your desired height
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                "The Manager",
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

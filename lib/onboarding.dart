import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_todo/utils/fade_in_button.dart';
import 'package:provider/provider.dart';


import 'controllers/onboarding_controller.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool _isVisible = false;
  int selectedAvatar = -1;


  @override
  Widget build(BuildContext context) {
    final onboardingController = Provider.of<OnboardingController>(context);
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 25,
              // width: 100,
              // color: Colors.white70,
              child: Text(
                "Select your Avatar",
                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                avatar(index: 0),
                avatar(index: 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                avatar(index: 2),
                avatar(index: 3),
              ],
            ),
            FadeInButtonDemo(),
          ],
        ),
      ),
    );
  }

  Widget avatar({required int index}) {
    final onboardingController = Provider.of<OnboardingController>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    String image = "";
    if (index == 0) {
      image = "lib/images/img_5.png";
    } else if (index == 1) {
      image = "lib/images/img_4.png";
    } else if (index == 2) {
      image = "lib/images/img_6.png";
    } else if (index == 3) {
      image = "lib/images/img_1.png";
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        borderRadius: BorderRadius.circular((w / 2 - 60) / 2),
        onTap: () {
          setState(() {
            selectedAvatar = index;
          });
          onboardingController.setIndex(index: index);
          if (kDebugMode) {
            print("selected index -> ${onboardingController.index}");
          }

        },
        child: Container(
          height: w / 2 - 60,
          width: w / 2 - 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.white,
            border: Border.all(
              color: selectedAvatar==index? Colors.greenAccent:Colors.transparent,
              // Adding the grey ring around the image
              width: 1.0, // You can adjust the width as needed
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

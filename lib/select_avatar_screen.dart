import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_todo/homescreen.dart';
import 'package:the_todo/utils/fade_in_button.dart';
import 'package:provider/provider.dart';

import 'controllers/select_avatar_controller.dart';

class SelectAvatarScreen extends StatefulWidget {
  const SelectAvatarScreen({super.key});

  @override
  State<SelectAvatarScreen> createState() => _SelectAvatarScreenState();
}

class _SelectAvatarScreenState extends State<SelectAvatarScreen> {
  int selectedAvatar = -1;

  @override
  Widget build(BuildContext context) {
    final onboardingController = Provider.of<SelectAvatarController>(context);
    print(onboardingController.index);

    return WillPopScope(
      onWillPop: () async {
        // You can add custom logic here, like showing a confirmation dialog.
        print("poppppeddd");
        onboardingController.setIndex(index: -1);
        return true; // Allow the pop
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1C1C1C),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Pop the current screen from the stack
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0), // Add some padding to the right
              child: GestureDetector(
                onTap: () {
                  // Action when 'Skip' is pressed
                  print('Skip pressed');
                  // You can also navigate or perform another action here
                },
                child: Center(
                  child: Text(
                    'Skip',
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff1C1C1C),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Container(
                child: Text(
                  "Select your Avatar",
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 15),
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
              Spacer(flex: 1),
              FadeInButtonDemo(isVisible: onboardingController.index > -1,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homescreen(), // Specify the screen to navigate to
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget avatar({required int index}) {
    final onboardingController = Provider.of<SelectAvatarController>(context);
    double w = MediaQuery.of(context).size.width;
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
            border: Border.all(
              color: selectedAvatar == index ? Colors.greenAccent : Colors.grey[700]!,
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

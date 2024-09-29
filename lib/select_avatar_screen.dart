import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_todo/controllers/auth_controller.dart';
import 'package:the_todo/homescreen.dart';
import 'package:the_todo/utils/fade_in_button.dart';
import 'package:provider/provider.dart';

import 'controllers/select_avatar_controller.dart';

class SelectAvatarScreen extends StatefulWidget {
  final String name;

  const SelectAvatarScreen({super.key, required this.name});

  @override
  State<SelectAvatarScreen> createState() => _SelectAvatarScreenState();
}

class _SelectAvatarScreenState extends State<SelectAvatarScreen> {
  int selectedAvatar = -1;
  String image = "";

  @override
  Widget build(BuildContext context) {
    final selectAvatarController = Provider.of<SelectAvatarController>(context);
    final authController = Provider.of<AuthController>(context);
    print(selectAvatarController.index);

    return WillPopScope(
      onWillPop: () async {
        // You can add custom logic here, like showing a confirmation dialog.
        print("poppppeddd");
        selectAvatarController.setIndex(index: -1);
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
              padding: const EdgeInsets.only(right: 16.0),
              // Add some padding to the right
              child: GestureDetector(
                onTap: () {
                  // Action when 'Skip' is pressed
                  print('Skip pressed');
                  authController.createUser(
                      name: widget.name,
                      avatar: selectAvatarController.avatarUrl != ""
                          ? selectAvatarController.avatarUrl
                          : "lib/images/img_5.png");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Homescreen(), // The screen to navigate to
                    ),
                    (Route<dynamic> route) =>
                        false, // This condition removes all routes from the stack
                  );
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
              FadeInButtonDemo(
                isVisible: selectAvatarController.index > -1,
                onTap: () {
                  authController.createUser(
                      name: widget.name,
                      avatar: selectAvatarController.avatarUrl);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Homescreen(), // The screen to navigate to
                    ),
                    (Route<dynamic> route) =>
                        false, // This condition removes all routes from the stack
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
    final selectAvatarController = Provider.of<SelectAvatarController>(context);
    double w = MediaQuery.of(context).size.width;
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
          print(image);
          selectAvatarController.setIndex(index: index);
          if (kDebugMode) {
            print("selected index -> ${selectAvatarController.index}");
          }
        },
        child: Container(
          height: w / 2 - 60,
          width: w / 2 - 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: selectAvatarController.index == index
                  ? Colors.greenAccent
                  : Colors.grey[700]!,
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

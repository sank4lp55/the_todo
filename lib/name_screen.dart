import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_todo/controllers/namescreen_controller.dart';
import 'package:the_todo/select_avatar_screen.dart';
import 'package:the_todo/utils/fade_in_button.dart';
import 'package:provider/provider.dart';

import 'components/custom_text_field.dart';
import 'controllers/select_avatar_controller.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  bool _isVisible = false;
  int selectedAvatar = -1;

  @override
  Widget build(BuildContext context) {
    final namescreenController = Provider.of<NamescreenController>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xff1C1C1C),
      //   leading: const Icon(
      //     Icons.arrow_back_ios,
      //     color: Colors.white,
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 16.0),
      //       // Add some padding to the right
      //       child: GestureDetector(
      //         onTap: () {
      //           // Action when 'Skip' is pressed
      //           print('Skip pressed');
      //           // Navigate to another screen or perform any other action
      //         },
      //         child: Center(
      //           child: Text(
      //             'Skip',
      //             style: GoogleFonts.montserrat(
      //               fontSize: 15,
      //               fontWeight: FontWeight.w600,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      backgroundColor: const Color(0xff1C1C1C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Container(
              child: Text(
                "Enter your Name",
                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            // SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                child: Container(
                  child: Image.asset(
                    "lib/images/img.png",
                    fit: BoxFit.cover,
                    width: 100, // Set your desired width
                    // height: 100, // Set your desired height
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              onTextChanged: (text) {
                print('Current text: $text');
                if (text.isNotEmpty) {
                  namescreenController.isFieldEmpty = false;
                }
                if (text.isEmpty) {
                  namescreenController.isFieldEmpty = true;
                }
              },
              hintText: "Naruto",
            ),

            const SizedBox(
              height: 20,
            ),
            FadeInButtonDemo(
              title: "Next",
              isVisible: !(namescreenController.isFieldEmpty),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectAvatarScreen(), // Specify the screen to navigate to
                  ),
                );
              },
            ),

            const Spacer(flex: 1),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

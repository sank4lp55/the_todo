import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/select_avatar_controller.dart';
import 'package:provider/provider.dart';

class FadeInButtonDemo extends StatefulWidget {
  final bool isVisible;
  final String? title;
  final Function()? onTap; // Callback function to execute

  // Constructor for FadeInButtonDemo
  FadeInButtonDemo({Key? key, required this.isVisible,this.onTap,this.title}) : super(key: key);

  @override
  _FadeInButtonDemoState createState() => _FadeInButtonDemoState();
}

class _FadeInButtonDemoState extends State<FadeInButtonDemo> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: widget.isVisible ==true ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: widget.isVisible ==true
              ?  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: widget.onTap,
                      child: Container(
                        width: w,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        child: Center(
                            child: Text(
                          widget.title??"Done",
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )),
                      ),
                    ),
                  )

              : Container(
            width: w,
            height: 45,
                  color: Colors.transparent,
                ), // Empty container to hide the button
        ),
      ],
    );
  }
}

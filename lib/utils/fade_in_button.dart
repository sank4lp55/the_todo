import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FadeInButtonDemo extends StatefulWidget {
  final bool isVisible;
  final String? title;
  final Color? titleColor;
  final Color? buttonColor;
  final Color? borderColor;

  final Function()? onTap; // Callback function to execute

  // Constructor for FadeInButtonDemo
  FadeInButtonDemo({Key? key, required this.isVisible, this.onTap, this.title, this.buttonColor,this.borderColor,this.titleColor}) : super(key: key);

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
          opacity: widget.isVisible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: widget.isVisible
              ? Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: widget.onTap,
              child: Container(
                width: w,
                height: 45,
                decoration: BoxDecoration(
                  color: widget.buttonColor ?? Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: widget.borderColor?? Colors.transparent, width: 1), // Add border here
                ),
                child: Center(
                  child: Text(
                    widget.title ?? "Done",
                    style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color:widget.titleColor?? Colors.black),
                  ),
                ),
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

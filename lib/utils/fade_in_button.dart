import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/onboarding_controller.dart';
import 'package:provider/provider.dart';

class FadeInButtonDemo extends StatefulWidget {
  @override
  _FadeInButtonDemoState createState() => _FadeInButtonDemoState();
}

class _FadeInButtonDemoState extends State<FadeInButtonDemo> {
  @override
  Widget build(BuildContext context) {
    final onboardingController = Provider.of<OnboardingController>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: onboardingController.index != -1 ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: onboardingController.index != -1
              ? Container(
                  width: 100,
                  height: 25,
                  color: Colors.white70,
                )
              : Container(
                  width: 100,
                  height: 25,
                  color: Colors.red,
                ), // Empty container to hide the button
        ),
      ],
    );
  }
}

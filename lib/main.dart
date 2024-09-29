import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:the_todo/controllers/onboarding_controller.dart';
import 'package:the_todo/onboarding.dart';

import 'controllers/manager_controller.dart';
import 'homescreen.dart';


Future<void> main() async {
  //initialize hive
  await Hive.initFlutter();

  //open box
  var box = await Hive.openBox("myBox");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingController()),  // Provide OnboardingController
        ChangeNotifierProvider(create: (_) => TodoProvider()),  // Provide another TodoProvider
        // Add more providers if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lime),
      home: Onboarding(),
    );
  }
}

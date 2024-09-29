import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:the_todo/Models/user_model.dart';
import 'package:the_todo/controllers/auth_controller.dart';
import 'package:the_todo/controllers/namescreen_controller.dart';
import 'package:the_todo/controllers/select_avatar_controller.dart';
import 'package:the_todo/select_avatar_screen.dart';
import 'package:the_todo/splash_screen.dart';

import 'controllers/manager_controller.dart';
import 'homescreen.dart';
import 'name_screen.dart';

Future<void> main() async {
  //initialize hive
  await Hive.initFlutter();

  // Register the adapter manually
  Hive.registerAdapter(UserAdapter());

  //open box
  var box = await Hive.openBox("myBox");
  print(box);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => NamescreenController()),
        ChangeNotifierProvider(create: (_) => SelectAvatarController()),
        // Provide OnboardingController
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        // Provide another TodoProvider
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
      home: SplashScreen(),
    );
  }
}

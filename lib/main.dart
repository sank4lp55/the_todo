import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'controllers/manager_controller.dart';
import 'homescreen.dart';


Future<void> main() async {
  //initialize hive
  await Hive.initFlutter();

  //open box
  var box = await Hive.openBox("myBox");

  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
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
      home: Homescreen(),
    );
  }
}

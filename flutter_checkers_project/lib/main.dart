import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/ui/screen/home.dart';
import 'package:flutter_checkers_project/src/ui/screen/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Schyler',
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)
      ),
      home: const HomeScreen(),
    );
  }
}
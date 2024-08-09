import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/play.dart';
import 'package:flutter_checkers_project/src/presenter/stores/board_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BoardStore()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Checkers',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Schyler',
          scaffoldBackgroundColor: const Color.fromARGB(255, 5, 7, 24)),
      home: const PlayScreen(),
    );
  }
}

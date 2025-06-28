import 'package:flutter/material.dart';
import 'package:learningapp/pages/homepage.dart';
import 'package:learningapp/pages/newtaskpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/newtask': (context) => const NewTaskPage(),
      },
      home: HomePage(),
    );
  }
}

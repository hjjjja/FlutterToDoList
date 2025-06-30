import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'To-Do List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) {
            if (settings.name == '/newtask') {
              return const NewTaskPage();
            }
            if (settings.name == '/') {
              return const HomePage();
            }
            return const HomePage();
          },
        ),
        home: HomePage(),
      ),
    );
  }
}

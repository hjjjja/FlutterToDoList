import 'package:flutter/material.dart';
import 'package:learningapp/defaultpage.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "About",
      child: Center(child: Text("About Page")),
    );
  }
}

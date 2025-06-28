import 'package:flutter/material.dart';
import 'package:learningapp/defaultpage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "Settings",
      child: Center(child: Text("Settings Page")),
    );
  }
}

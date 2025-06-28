import 'package:flutter/material.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "New Task Page",
        style: const TextStyle(
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
      ),
    );
  }
}

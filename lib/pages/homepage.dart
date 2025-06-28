import 'package:flutter/material.dart';
import 'package:learningapp/defaultpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'To-Do List',
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Task ${index + 1} dismissed!'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: ListTile(
              title: Text(
                'Task ${index + 1}',
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text(
                'This is a sample task description.',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: const Icon(Icons.check_circle_outline),
              onTap: () {
                Navigator.pushNamed(context, '/newtask');
              },
            ),
          );
        },
      ),
    );
  }
}

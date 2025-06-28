import 'package:flutter/material.dart';
import 'package:learningapp/defaultpage.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "Make a New Task",
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Enter task title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              style: const TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Enter task description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logic to save the new task
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('New task created!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                'Create Task',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

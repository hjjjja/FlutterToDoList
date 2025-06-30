import 'package:flutter/material.dart';
import 'package:learningapp/Scripts/task.dart';
import 'package:learningapp/Scripts/taskfunctions.dart';
import 'package:learningapp/defaultpage.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return DefaultPage(
      title: "Make a New Task",
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
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
              controller: descriptionController,
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
              onPressed: () async {
                addTask(
                  Task(
                    index: await getIndex(),
                    title: titleController.text,
                    description: descriptionController.text,
                  ),
                );
                if (titleController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in both fields'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('New task created!'),
                    duration: Duration(seconds: 2),
                  ),
                );
                titleController.clear();
                descriptionController.clear();
                Navigator.pop(context); // Go back to the previous page
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

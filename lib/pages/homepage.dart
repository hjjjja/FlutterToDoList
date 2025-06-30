import 'package:flutter/material.dart';
import 'package:learningapp/Scripts/task.dart';
import 'package:learningapp/Scripts/taskfunctions.dart';
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
      child: FutureBuilder<List<Task>>(
        future: () async {
          var alltasks = await getAllTasks();
          return alltasks;
        }(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final tasks = snapshot.data!;
            if (tasks.isEmpty) {
              return const Center(
                child: Text(
                  'No tasks available',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              );
            } else {
              int alltasks = tasks.length;
              return ListView.builder(
                itemCount: alltasks,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(
                      task.title,
                      style: const TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      task.description,
                      style: const TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(Icons.check_circle_outline),
                    onTap: () {
                      Navigator.pushNamed(context, '/newtask');
                    },
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

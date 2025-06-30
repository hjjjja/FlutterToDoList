import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:learningapp/Scripts/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkNullTask() async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('tasks')) {
    await prefs.setString('tasks', jsonEncode([])); // empty JSON array
  }
}

Future<int> getIndex() async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('tasks');
  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    if (jsonList.isNotEmpty) {
      Task lastTask = Task.fromJson(jsonList.first);
      return lastTask.index + 1; // Return the next index
    } else {
      return 0; // If no tasks exist, start from index 0
    }
  } else {
    return 0; // If no tasks exist, start from index 0
  }
}

Future<void> addTask(Task task) async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('tasks');
  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    jsonList.add(task.toJson());
    String updatedJsonString = jsonEncode(jsonList);
    await prefs.setString('tasks', updatedJsonString);
    updateTaskOrder(); // Ensure tasks are sorted after adding
  } else {
    throw Exception('JSON string is null, cannot add task');
  }
}

Future<void> removeTask(int index) async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('tasks');
  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    jsonList.removeAt(index);
    String updatedJsonString = jsonEncode(jsonList);
    await prefs.setString('tasks', updatedJsonString);
  }
}

Future<List<Task>> getAllTasks() async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('tasks');

  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Task.fromJson(json)).toList();
  } else {
    return [];
  }
}

Future<void> updateTaskOrder() async {
  List<Task> tasks = await getAllTasks();
  tasks.sort((a, b) => b.index.compareTo(a.index));
  final prefs = await SharedPreferences.getInstance();
  String updatedJsonString = jsonEncode(
    tasks.map((task) => task.toJson()).toList(),
  );
  await prefs.setString('tasks', updatedJsonString);
}

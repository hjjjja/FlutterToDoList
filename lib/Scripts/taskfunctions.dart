import 'dart:convert';
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
      Task lastTask = Task.fromJson(jsonList.last);
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
  } else {
    throw Exception('JSON string is null, cannot add task');
  }
}

Future<void> removeTask(Task task) async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('tasks');
  if (jsonString != null) {
    List<Task> jsonList = jsonDecode(jsonString);
    jsonList.removeWhere((t) => t.index == task.index);
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

class Task {
  int index;
  String title;
  String description;

  Task({required this.index, required this.title, required this.description});

  // convert to json
  Map<String, dynamic> toJson() => {
    'index': index,
    'title': title,
    'description': description,
  };

  // convert from json
  factory Task.fromJson(Map<String, dynamic> json) => Task(
    index: json['index'],
    title: json['title'],
    description: json['description'],
  );
}

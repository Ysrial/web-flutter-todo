class Task {
  final String id;
  final String title;
  bool done;

  Task({required this.id, required this.title, this.done = false});

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      done: map['done'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'done': done,
    };
  }
}

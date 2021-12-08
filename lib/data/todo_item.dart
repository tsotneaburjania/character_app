class TodoItem {
  final int id;
  final String todo;
  final String description;

  TodoItem({
    required this.id,
    required this.todo,
    required this.description,
  });

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'],
      todo: json['todo'],
      description: json['description'],
    );
  }
}
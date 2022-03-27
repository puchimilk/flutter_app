class Todo {
  const Todo({
    this.id,
    required this.title,
    required this.updated,
    this.note,
  });

  final int? id;
  final String title;
  final DateTime updated;
  final String? note;

  Map<String, dynamic> toMap() => <String, dynamic>{
    'title': title,
    'updated': updated.toString(),
    'note': note,
  };
}

import 'package:flutter_app/importer.dart';
import 'package:sqflite/sqflite.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController noteController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        actions: [
          IconButton(
            onPressed: () async {
              final todo = Todo(
                title: titleController.text,
                updated: DateTime.now(),
                note: noteController.text,
              );
              await _insertTodo(todo);

              Routemaster.of(context).pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'タイトル',
                border: OutlineInputBorder(),
              ),
            ),
            pt8,
            TextField(
              controller: noteController,
              decoration: const InputDecoration(
                hintText: 'ノート',
                border: OutlineInputBorder(),
              ),
            ),
            pt8,
            const TextField(
              decoration: const InputDecoration(
                hintText: '期日',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _insertTodo(Todo todo) async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, updated TEXT, note TEXT)',
        );
      },
    );

    final Database db = await database;
    await db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

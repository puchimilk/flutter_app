import 'package:flutter_app/importer.dart';
import 'package:sqflite/sqflite.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Todo>> watch = ref.watch(todoProvider);
    AsyncValue<List<Todo>> refresh = ref.refresh(todoProvider);

    return RefreshIndicator(
      onRefresh: () async => refresh,
      child: watch.when(
        data: (todos) {
          if (todos.isEmpty)
            return const Center(child: Text('Todo List'));

          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, i) {
              final todo = todos[i];

              return InkWell(
                onLongPress: () async {
                  debugPrint('onLongPress');
                  final info = await showMessageDialog(
                    context,
                    message: '削除しますか？',
                  );

                  if (info)
                    _deleteTodo(todo.id!);
                },
                child: ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.note ?? ''),
                ),
              );
            },
            itemCount: todos.length,
          );
        },
        error: (error, stack) => Text('Error: $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Future<void> _deleteTodo(int id) async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, updated TEXT, note TEXT)',
        );
      },
    );

    final db = await database;
    await db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

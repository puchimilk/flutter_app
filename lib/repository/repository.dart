import '/importer.dart';

class Repository {
  Stream<List<Todo>> fetchTodo() async* {
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
    final List<Map<String, dynamic>> maps = await db.query('todo');

    yield List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'] ?? 'null',
        updated: DateTime(2021, 01, 01),
        note: maps[i]['note'] ?? 'null',
      );
    });
  }

  Future<List<Event>> fetchEvent() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'event.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE event(id INTEGER PRIMARY KEY AUTOINCREMENT, summary TEXT, description TEXT, created TEXT, updated TEXT, location TEXT, colorId INTEGER, startDate TEXT, endDate TEXT, isAllDay INTEGER)',
        );
      },
    );

    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('event');

    return List.generate(maps.length, (i) {
      return Event(
        id: maps[i]['id'],
        summary: maps[i]['summary'],
        description: maps[i]['description'],
        created: maps[i]['created'],
        updated: maps[i]['updated'],
        location: maps[i]['location'],
        colorId: maps[i]['colorId'],
        startDate: maps[i]['startDate'],
        endDate: maps[i]['endDate'],
        isAllDay: maps[i]['isAllDay'],
      );
    });
  }
}

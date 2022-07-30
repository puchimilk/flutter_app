import 'package:flutter_app/importer.dart';
import 'package:sqflite/sqflite.dart';

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
        id: maps[i]['id'] as int,
        title: maps[i]['title'] as String,
        updated: DateTime(2021, 01, 01),
        note: maps[i]['note'] as String,
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
        id: maps[i]['id'] as int,
        summary: maps[i]['summary'] as String,
        description: maps[i]['description'] as String,
        created: maps[i]['created'] as DateTime,
        updated: maps[i]['updated'] as DateTime,
        location: maps[i]['location'] as String,
        colorId: maps[i]['colorId'] as int,
        startDate: maps[i]['startDate'] as DateTime,
        endDate: maps[i]['endDate'] as DateTime,
        isAllDay: maps[i]['isAllDay'] as bool,
      );
    });
  }
}

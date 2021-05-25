import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Calendar {
  Calendar({
    this.id,
    this.title,
    this.start,
    this.end,
  });
  
  final int id;
  final String title;
  final DateTime start;
  final DateTime end;
  
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title' : title,
      'start' : start,
      'end' : end,
    };
  }
  
  static Future<Database> get database async {
    final Future<Database> _database = openDatabase(
      join(await getDatabasesPath(), 'calendar_database.db'),
      onCreate: (Database db, int version) {
        return db.execute(
          "CREATE TABLE calendar(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, start TEXT, end TEXT)",
        );
      },
      version: 1,
    );
    return _database;
  }
  
  static Future<void> insertCalendar(Calendar calendar) async {
    final Database db = await database;
    await db.insert(
      'calendar',
      calendar.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  static Future<List<Calendar>> getCalendars() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('calendar');
    return List.generate(maps.length, (i) {
      return Calendar(
        id: maps[i]['id'],
        title: maps[i]['title'],
        start: maps[i]['start'],
        end: maps[i]['end'],
      );
    });
  }
  
  static Future<void> updateCalendar(Calendar calendar) async {
    final db = await database;
    await db.update(
      'calendar',
      calendar.toMap(),
      where: "id = ?",
      whereArgs: [calendar.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }
  
  static Future<void> deleteCalendar(int id) async {
    final db = await database;
    await db.delete(
      'calendar',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

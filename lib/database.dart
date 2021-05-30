import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final database = openDatabase(
    join(await getDatabasesPath(), 'calendar_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE calendar(id INTEGER PRIMARY KEY, year INTEGER, month INTEGER, day INTEGER)',
      );
    },
    version: 1,
  );
  
  Future<void> insertCalendar(Calendar calendar) async {
    final db = await database;
    
    await db.insert(
      'calendars',
      calendar.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  print(insertCalendar(null));
  
  Future<List<Calendar>> calendars() async {
    final db = await database;
    
    final List<Map<String, dynamic>> maps = await db.query('calendars');
    
    return List.generate(maps.length, (i) {
      return Calendar(
        id: maps[i]['id'],
        year: maps[i]['year'],
        month: maps[i]['month'],
        day: maps[i]['day'],
        weekday: maps[i]['weekday'],
      );
    });
  }
  
  print(calendars());
  
  Future<void> updateCalendar(Calendar calendar) async {
    final db = await database;
    
    await db.update(
      'calendars',
      calendar.toMap(),
      where: 'id = ?',
      whereArgs: [calendar.id],
    );
  }
  
  print(updateCalendar(null));
  
  Future<void> deleteCalendar(int id) async {
    final db = await database;
    
    await db.delete(
      'calendars',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  
  print(deleteCalendar(null));
}

class Calendar {
  Calendar({
    this.id,
    this.year,
    this.month,
    this.day,
    this.weekday,
  });
  
  final int id;
  final int year;
  final int month;
  final int day;
  final int weekday;
  
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'year' : year,
      'month' : month,
      'day' : day,
      'weekday' : weekday,
    };
  }
  
  @override
  String toString() {
    return 'Calendar{id: $id, year: $year, month: $month, day: $day, weekday: $weekday}';
  }
}
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'calendar_database.db'),
    version: 1,
    onCreate: (Database db, int version) {
      return db.execute(
        'CREATE TABLE Date (id INTEGER PRIMARY KEY, year INTEGER, month INTEGER, day INTEGER, weekday INTEGER)',
      );
    }
  );

  Future<void> insert(Date date) async {
    final Database db = await database;
    await db.insert(
      'Date',
      date.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  var startDate = DateTime(1899, 12, 31);
  var endDate = DateTime(2100, 1, 2);
  // 73051
  /*
  for (var i = 0; i < 10; i++) {
    var a;
    var date = DateTime(1899, 12, 31);
    var b = DateTime(date.year, date.month, date.day + i);
    a = Date(
      id: i,
      year: b.year,
      month: b.month,
      day: b.day,
      weekday: b.weekday,
    );
    await insert(a);
  }
  */

  Future<List<Date>> getDate() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Date');
    return List.generate(maps.length, (i) {
      return Date(
        id: maps[i]['id'],
        year: maps[i]['year'],
        month: maps[i]['month'],
        day: maps[i]['day'],
        weekday: maps[i]['weekday'],
      );
    });
  }

  Future<void> update(Date date) async {
    final Database db = await database;
    await db.update(
      'Date',
      date.toMap(),
      where: 'id = ?',
      whereArgs: [date.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  //print('print: ${await getDate()}');
}

class Date {
  Date({
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
      'id': id,
      'year': year,
      'month': month,
      'day': day,
      'weekday': weekday,
    };
  }

  @override
  String toString() {
    return 'Date{id: $id, year: $year, month: $month, day: $day, weekday: $weekday}';
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(
        title: 'Calendar',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);
  
  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
  }
  
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate;
    DateTime endDate;
    startDate = DateTime.now();
    endDate = startDate.add(Duration(days: 365));
    var milliseconds = endDate.millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;
    var list = [];
    var st = 'A';
    for (var i = 0; i < milliseconds; i++) {
      list.add(st);
    }
    print('print: ${list.length}');
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}

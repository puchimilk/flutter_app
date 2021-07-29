import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  runApp(MyApp());
}

class Date {
  Date({
    this.id,
    this.fulldate,
    this.year,
    this.month,
    this.day,
    this.weekday,
  });

  final int id;
  final String fulldate;
  final int year;
  final int month;
  final int day;
  final int weekday;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fulldate': fulldate,
      'year': year,
      'month': month,
      'day': day,
      'weekday': weekday,
    };
  }

  @override
  String toString() {
    return 'Date{id: $id, fulldate: $fulldate, year: $year, month: $month, day: $day, weekday: $weekday}';
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

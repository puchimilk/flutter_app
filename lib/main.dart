import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils.dart';
import 'src/CalendarViewController.dart';

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
  var first = DateTime(1800, 1);
  var last = DateTime(2099, 12);
  int monthCount(DateTime first, DateTime last) {
    var year = last.year - first.month;
    var month = last.month - first.month;
    return year * 12 + month;
  }
  print(monthCount(first, last));
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
    Key? key,
    this.title,
  }) : super(key: key);
  
  final String? title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Container(
        child: Column(
          children: [
            //MonthCalendarView(),
            MonthView(
              firstDate: DateTime(1800, 1),
              lastDate: DateTime(2099, 12),
              focusDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}

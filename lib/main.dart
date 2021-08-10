import 'package:flutter/material.dart';
import 'src/MonthCalendarView.dart';
import 'src/CalendarViewController.dart';

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
  var date = DateTime(2020, 9);
  print(MonthView().getCalendar(date));
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
            MonthCalendarView(),
          ],
        ),
      ),
    );
  }
}

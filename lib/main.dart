import 'package:flutter/material.dart';
import 'package:flutter_app/src/month_calendar_view.dart';

//import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Source Han Sans',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  
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
  
  final now = DateTime.now();
  
  String monthConverter(int month) {
    String monthCon;
    switch (month) {
      case 1:
        monthCon = 'January';
        break;
      case 2:
        monthCon = 'February';
        break;
      case 3:
        monthCon = 'March';
        break;
      case 4:
        monthCon = 'April';
        break;
      case 5:
        monthCon = 'May';
        break;
      case 6:
        monthCon = 'June';
        break;
      case 7:
        monthCon = 'Julr';
        break;
      case 8:
        monthCon = 'August';
        break;
      case 9:
        monthCon = 'September';
        break;
      case 10:
        monthCon = 'October';
        break;
      case 11:
        monthCon = 'Novenber';
        break;
      case 12:
        monthCon = 'December';
        break;
    }
    return monthCon;
  }
  
  String weekdayConverter(int weekday) {
    String weekdayCon;
    switch (weekday) {
      case 0:
        weekdayCon = 'Sun';
        break;
      case 1:
        weekdayCon = 'Mon';
        break;
      case 2:
        weekdayCon = 'Tue';
        break;
      case 3:
        weekdayCon = 'Wed';
        break;
      case 4:
        weekdayCon = 'Thu';
        break;
      case 5:
        weekdayCon = 'Fri';
        break;
      case 6:
        weekdayCon = 'Sat';
        break;
      default:
    }
    return weekdayCon;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 32,
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
            print('LeftIcon');
          },
        ),
        title: Center(
          child: Text('Hello'),
        ),
        actions: [
          SizedBox(
            width: 56,
            height: 56,
            child: IconButton(
              iconSize: 32,
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {
                print('RightIcon');
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              height: 32,
              alignment: Alignment.centerLeft,
              child: Text(
                '${monthConverter(now.month)} ${now.year}',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Source Han Sans',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 32,
              child: Row(
                children: List.generate(7, (index) {
                  return Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        weekdayConverter(index),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            MonthCalendarView(),
          ],
        ),
      ),
    );
  }
}

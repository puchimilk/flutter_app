import 'package:flutter/material.dart';
import 'package:flutter_app/src/month_calendar_view.dart';

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
        fontFamily: 'Roboto',
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
        weekdayCon = 'SUN';
        break;
      case 1:
        weekdayCon = 'MON';
        break;
      case 2:
        weekdayCon = 'TUE';
        break;
      case 3:
        weekdayCon = 'WED';
        break;
      case 4:
        weekdayCon = 'THU';
        break;
      case 5:
        weekdayCon = 'FRI';
        break;
      case 6:
        weekdayCon = 'SAT';
        break;
      default:
    }
    return weekdayCon;
  }
  
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double statuBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Center(
          child: Text('Calendar'),
        ),
        actions: [
          SizedBox(
            width: 56,
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
      ),
    );
  }
}

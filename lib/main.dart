import 'package:flutter/material.dart';

import 'src/month_calendar_view.dart';

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
        child: MonthCalendarView(),
      ),
    );
  }
}

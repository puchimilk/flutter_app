import 'package:flutter/material.dart';

// SQLlite
// import 'dart:async';
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
  
  int _selectedIndex;
  
  _onSelected(int index) {
    setState(() => {
      _selectedIndex = index
    });
  }
  
  var data = [];
  
  void _counter(int index) {
    setState(() {
      data.add(index);
      if (data.length > 2) {
        data.removeAt(0);
      }
      if (data.length == 2 && data[0] == data[1]) {
        _showDialog();
      }
    });
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
            Expanded (
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size size = Size(constraints.maxWidth, constraints.maxHeight);
                  
                  return Wrap(
                    children: List.generate(35, (index) {
                      return SizedBox(
                        width: size.width / 7,
                        height: size.height / 5,
                        child: GestureDetector(
                          child: Container(
                            color: _selectedIndex == index
                                ? Colors.black12
                                : Colors.transparent,
                            child: Text('$index'),
                          ),
                          onTap: () {
                            _onSelected(index);
                            _counter(index);
                          },
                        ),
                      );
                    }),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.fromLTRB(32, 64, 32, 64),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2021年5月22日(土)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '21週　友引',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            iconSize: 32,
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}

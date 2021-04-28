import 'package:flutter/material.dart';

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
  final PageController controller = PageController();
  
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
          icon: Icon(Icons.menu),
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
              icon: Icon(Icons.add),
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
              width: 350,
              height: 400,
              child: Column(
                children: [
                  Container(
                    height: 24,
                    child: Row(
                      children: List.generate(7, (i) {
                        return Expanded(
                          child: Container(
                            child: Text('$i'),
                          ),
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      itemBuilder: (BuildContext context, int i) {
                        var calendar = [];
                        // ベース
                        final base = DateTime(1900, 01, 01);
                        // 今月の初日
                        final firstday = DateTime(base.year, base.month + i, 1);
                        var firstdayWeekday = firstday.weekday;
                        if (firstdayWeekday == 7) {
                          firstdayWeekday = 0;
                        }
                        // 先月の最終日
                        final lastdayLastmonth = DateTime(firstday.year, firstday.month, 0);
                        var lastdayLastmonthWeekday = lastdayLastmonth.weekday;
                        if (lastdayLastmonthWeekday == 7) {
                          lastdayLastmonthWeekday = 0;
                        }
                        // 先月の日にちを追加
                        for (var i = 0; i < firstday.weekday; i++) {
                          if (firstdayWeekday != 0) {
                            var reverseDay = lastdayLastmonth.day - lastdayLastmonthWeekday;
                            calendar.add(reverseDay + i);
                          }
                        }
                        // 今月の最終日
                        final lastday = DateTime(base.year, base.month + i + 1, 0);
                        // 今月の最終日の曜日
                        var lastdayWeekday = lastday.weekday;
                        if (lastdayWeekday == 7) {
                          lastdayWeekday = 0;
                        }
                        // 今月の日にちを追加
                        for (var i = 0; i < lastday.day; i++) {
                          calendar.add(firstday.day + i);
                        }
                        final d = DateTime(base.year, base.month + i, 1);
                        // 来月の日にちを追加
                        for (var i = 0; i < 6 - lastdayWeekday; i++) {
                          if (lastdayWeekday != 6) {
                            calendar.add(d.day + i);
                          }
                        }
                        // 週の回数
                        int weekNumber;
                        if (calendar.length == 35) {
                          weekNumber = 5;
                        } else if (calendar.length == 42) {
                          weekNumber = 6;
                        }
                        
                        return Container(
                          child: Column(
                            children: List.generate(weekNumber, (i) {
                              var columnIndex = i;
                              return Expanded(
                                child: Container(
                                  child: Row(
                                    children: List.generate(7, (i) {
                                      var rowIndex = i;
                                      int testIndex = 0;
                                      if (columnIndex == 0) {
                                        testIndex = rowIndex;
                                      }
                                      if (columnIndex == 1) {
                                        testIndex = columnIndex + 6 + rowIndex;
                                      }
                                      if (columnIndex == 2) {
                                        testIndex = columnIndex + 12 + rowIndex;
                                      }
                                      if (columnIndex == 3) {
                                        testIndex = columnIndex + 18 + rowIndex;
                                      }
                                      if (columnIndex == 4) {
                                        testIndex = columnIndex + 24 + rowIndex;
                                      }
                                      if (columnIndex == 5) {
                                        testIndex = columnIndex + 30 + rowIndex;
                                      }
                                      if (columnIndex == 6) {
                                        testIndex = columnIndex + 36 + rowIndex;
                                      }
                                      
                                      return Expanded(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Text('${calendar[testIndex]}'),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                      itemCount: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

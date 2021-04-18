import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

GlobalKey key = GlobalKey();
OverlayEntry overlayEntry;

class _MyHomePageState extends State<MyHomePage> {
  final weekday = [
    'SAN',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT'
  ];

  void initState() {
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
    overlayEntry = OverlayEntry(
      opaque: false,
      builder: (context) => monthCalendar(context),
    );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(overlayEntry);
    });
    super.initState();
  }

  void dispose() {
    overlayEntry.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '0000年00月',
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: List.generate(7, (i) {
                  var weekcolor = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  );
                  switch (i) {
                    case 0:
                      weekcolor = TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      );
                      break;
                    case 6:
                      weekcolor = TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      );
                      break;
                  }
                  return Expanded(
                    child: Container(
                      height: 32,
                      child: Center(
                        child: Text(
                          weekday[i],
                          style: weekcolor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: Container(
                key: key,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget monthCalendar(BuildContext context) {
    final RenderBox renderBox = key.currentContext.findRenderObject();
    final Size size = renderBox.size;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final controller = PageController(
      // ページの初期位置
      initialPage: 0,
    );

    // 今日の日付
    final baseDate = DateTime(1900, 01, 01);
    // 先月の最終日
    final lastDayOfLastMonth = DateTime(baseDate.year, baseDate.month, 0);
    // 来月の初日
    final firstDayOfNextMonth = DateTime(baseDate.year, baseDate.month + 1, 1);
    // 今月の初日
    final firstDay = DateTime(baseDate.year, baseDate.month, 1);
    // 今月の最終日
    final lastDay = DateTime(baseDate.year, baseDate.month + 1, 0);
    // 空のリストを作成
    var date = [];
    var firstDayWeekDay = firstDay.weekday;
    if (firstDayWeekDay == 7) {
      firstDayWeekDay = 0;
    }
    var lastDayOfLastMonthWeekDay = lastDayOfLastMonth.weekday;
    if (lastDayOfLastMonth.weekday == 7) {
      lastDayOfLastMonthWeekDay = 0;
    }
    // 先月の日付を追加
    for (var i = 0; i < firstDay.weekday; i++) {
      if (firstDayWeekDay != 0) {
        var reverseDay = lastDayOfLastMonth.day - lastDayOfLastMonthWeekDay;
        date.add(reverseDay + i);
      }
    }
    // 今月の日付を追加
    for (var i = 0; i < lastDay.day; i++) {
      date.add(firstDay.day + i);
    }
    // 来月の日付を追加
    for (var i = 0; i < firstDayOfNextMonth.day + (6 - firstDayOfNextMonth.weekday); i++) {
      if (lastDay.weekday != 6) {
        date.add(firstDayOfNextMonth.day + i);
      }
    }
    int weekNumber;
    if (date.length == 35) {
      weekNumber = 5;
    } else {
      weekNumber = 6;
    }

    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (context, i) {
                return Material(
                  color: Colors.transparent,
                  child: Wrap(
                    children: List.generate(date.length, (i) {
                      return SizedBox(
                        width: size.width / 7,
                        height: size.height / weekNumber,
                        child: Container(
                          child: Text(
                            '${date[i]}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
              // ページ数
              itemCount: 2400,
            ),
          ),
        ),
      ],
    );
  }
}

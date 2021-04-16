import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey key = GlobalKey();
  OverlayEntry overlayEntry;
  final weekday = ['日', '月', '火', '水', '木', '金', '土'];

  void initState() {
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
    overlayEntry = OverlayEntry(
      opaque: false,
      builder: (context) => Calendar(),
    );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(overlayEntry);
    });
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: List.generate(7, (i) {
                  var weekcolor = TextStyle(color: Colors.black);
                  switch (i) {
                    case 0:
                      weekcolor = TextStyle(color: Colors.red);
                      break;
                    case 6:
                      weekcolor = TextStyle(color: Colors.blue);
                      break;
                  }
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      height: 28,
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
}

class Calendar extends StatefulWidget {
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 200,
    );

    return PageView(
      controller: controller,
    );
  }
}

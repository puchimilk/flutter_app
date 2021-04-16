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

GlobalKey key = GlobalKey();
OverlayEntry overlayEntry;

class _MyHomePageState extends State<MyHomePage> {
  final weekday = ['日', '月', '火', '水', '木', '金', '土'];

  void initState() {
    /*
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
    */
    super.initState();
  }

  void dispose() {
    // overlayEntry.remove();
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
              child: monthCalendar(context),
            ),
          ],
        ),
      ),
    );
  }

  final controller = PageController(
    // 表示初期位置
    initialPage: 0,
  );

  Widget monthCalendar(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, i) {
        return Container(
          color: Colors.amber,
          child: Text(
            '$i',
          ),
        );
      },
      // ページ数
      itemCount: 200,
    );
  }
}

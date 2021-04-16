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
  final weekday = ['San', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

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
                  var weekcolor = TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold);
                  switch (i) {
                    case 0:
                      weekcolor = TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold);
                      break;
                    case 6:
                      weekcolor = TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold);
                      break;
                  }
                  return Expanded(
                    child: Container(
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
                color: Colors.greenAccent,
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
      // 表示初期位置
      initialPage: 0,
    );

    print(size);
    print(position);

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
                    children: List.generate(35, (i) {
                      return SizedBox(
                        width: size.width / 7,
                        height: size.height / 5,
                        child: Container(
                          child: Text(
                            '$i',
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
              itemCount: 200,
            ),
          ),
        ),
      ],
    );
  }
}

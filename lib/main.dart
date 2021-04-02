import 'package:flutter/material.dart';

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
  var date = DateTime(1900, 01, 01);
  final controller = PageController(
    initialPage: 200,
  );

  @override
  Widget build(BuildContext context) {
    print(date);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Text(
              '$index',
            ),
          );
        },
      ),
    );
  }
}

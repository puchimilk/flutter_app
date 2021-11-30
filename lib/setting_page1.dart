import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {
  TestPage1({Key? key}) : super(key: key);

  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Center(
          child: Text('設定画面1'),
        ),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text('設定1'),
            ),
          ],
        ),
      ),
    );
  }
}

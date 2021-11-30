import 'package:flutter/material.dart';

class ModalPage extends StatefulWidget {
  ModalPage();

  State<ModalPage> createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.close),
        ),
        title: Center(
          child: Text('タイトル'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        height: 300,
      ),
    );
  }
}

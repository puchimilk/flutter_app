import 'package:flutter/material.dart';
import 'package:flutter_app/dayly_page.dart';

import 'modal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Source Han Sans JP Regular',
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onTap(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.945),
            isScrollControlled: true,
            enableDrag: false,
            builder: (context) => Navigator(
              onGenerateRoute: (context) => MaterialPageRoute<ModalPage>(
                builder: (context) => ModalPage(),
              ),
            ),
          ),
          padding: const EdgeInsets.all(12),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          '2021年12月',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            //fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            //onPressed: () => controller.jumpToPage(initialPage),
            onPressed: () {},
            padding: const EdgeInsets.all(12),
            icon: const Icon(
              Icons.today,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 1,
        toolbarHeight: 48,
        leadingWidth: 48,
        backgroundColor: Colors.white,
      ),
      body: DaylyPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'red',
            icon: Icon(
              Icons.layers,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            label: 'green',
            icon: Icon(
              Icons.layers,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            label: 'blue',
            icon: Icon(
              Icons.layers,
              color: Colors.blue,
            ),
          ),
        ],
        selectedItemColor: Colors.grey,
        elevation: 1,
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

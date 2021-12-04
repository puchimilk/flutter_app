import 'dart:typed_data';

import 'package:charset_converter/charset_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'modal_page.dart';
import 'model/holiday_model.dart';
import 'monthly_page.dart';
import 'utils.dart';

void main() {
  runApp(const MyApp());
}

Future<List<HolidayModel>> loadAsset() async {
  ByteData byteData = await rootBundle.load('assets/syukujitsu.csv');
  Uint8List uint8list = byteData.buffer.asUint8List();
  String? decode = await CharsetConverter.decode('cp932', uint8list);
  String trim = decode!.trim();
  List<HolidayModel> list = [];
  for (String line in trim.split('\r\n')) {
    List<String> rows = line.split(',');
    if (rows[0] == '国民の祝日・休日月日' && rows[1] == '国民の祝日・休日名称') continue;
    DateTime date = stringToDate(rows[0]);
    HolidayModel holidayModel = HolidayModel(date: date, name: rows[1]);
    list.add(holidayModel);
  }
  return list;
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
          icon: const Icon(Icons.settings),
        ),
        centerTitle: true,
        title: Text(
          'カレンダー',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            //onPressed: () => controller.jumpToPage(initialPage),
            onPressed: () {},
            padding: const EdgeInsets.all(12),
            icon: const Icon(Icons.today),
          ),
        ],
        elevation: 1,
        toolbarHeight: 48,
        leadingWidth: 48,
      ),
      body: MonthlyPage(),
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
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

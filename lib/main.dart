import 'package:flutter/material.dart';
import 'package:flutter_app/utils.dart';

import 'modal_page.dart';

void main() {
  runApp(const MyApp());
  //var date = DateTime(1955, 1, 1);
  //var calendar = Calendar().isHolidays(date);
  //debugPrint('$calendar');
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double width = 24;
          final double height = 80;
          final int min = 60;
          final double min15 = (height / min) * 15;
          final double min30 = (height / min) * 30;
          final double min45 = (height / min) * 45;
          final double min60 = (height / min) * 60;
          final TextStyle textStyle = TextStyle(
            height: 1.2,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          );
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              children: [
                Column(
                  children: List.generate(24, (index) {
                    return Container(
                      width: width,
                      height: height,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Text('$index'),
                    );
                  }),
                ),
                SizedBox(
                  width: constraints.maxWidth - width,
                  height: height * 24,
                  child: Stack(
                    children: [
                      Column(
                        children: List.generate(24, (index) {
                          return Container(
                            width: constraints.maxWidth - width,
                            height: height,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black12)),
                            ),
                          );
                        }),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          width: constraints.maxWidth - width,
                          height: height * 24,
                          child: Stack(
                            children: [
                              Positioned(
                                top: height * 0,
                                child: Container(
                                  color: Colors.red,
                                  width: constraints.maxWidth - width,
                                  height: min15,
                                  child: Text(
                                    'イベント 1',
                                    style: textStyle,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: height * 15,
                                child: Container(
                                  color: Colors.amber,
                                  width: constraints.maxWidth - width,
                                  height: min45,
                                  child: Text(
                                    'イベント 2',
                                    style: textStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
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

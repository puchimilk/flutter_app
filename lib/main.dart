import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bottom_navigation.dart';

import 'modal_page.dart';
import 'monthly_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _pageTransitionTheme = PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Source Han Sans JP',
        pageTransitionsTheme: _pageTransitionTheme,
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
  void _onPressedShowModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.945),
      isScrollControlled: true,
      enableDrag: false,
      builder: (context) => Navigator(
        onGenerateRoute: (context) => MaterialPageRoute<ModalPage>(
          builder: (context) => ModalPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          padding: const EdgeInsets.all(12),
          onPressed: _onPressedShowModalBottomSheet,
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
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(12),
            onPressed: () {},
          ),
          IconButton(
            //onPressed: () => controller.jumpToPage(initialPage),
            icon: const Icon(
              Icons.today,
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(12),
            onPressed: () {},
          ),
        ],
        elevation: 1,
        toolbarHeight: 48,
        leadingWidth: 48,
        backgroundColor: Colors.white,
      ),
      body: MonthlyPage(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/add_event_page.dart';
import 'package:flutter_app/modal_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const _pageTransitionTheme = PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Source Han Sans JP',
        pageTransitionsTheme: _pageTransitionTheme,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _shomModalPage(context),
        ),
        title: Text('タイトル'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            padding: EdgeInsets.all(12),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.today),
            padding: EdgeInsets.all(12),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddEventPage(context),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  void _shomModalPage(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.95;
    BoxConstraints constraints = BoxConstraints.expand(height: height);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: constraints,
      builder: (context) => ModalPage(),
    );
  }

  void _showAddEventPage(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.95;
    BoxConstraints constraints = BoxConstraints.expand(height: height);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: constraints,
      builder: (context) => AddEventPage(),
    );
  }
}

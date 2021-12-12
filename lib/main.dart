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
    const ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('MyApp build()');

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _shomModalPage(context),
        ),
        title: const Text('タイトル'),
        actions: [
          SizedBox(
            width: 56,
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 56,
            child: IconButton(
              icon: const Icon(Icons.today),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddEventPage(context),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  void _shomModalPage(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final double height = data.size.height - data.padding.top;
    final BoxConstraints constraints = BoxConstraints(maxHeight: height);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: constraints,
      builder: (context) => const ModalPage(),
    );
  }

  void _showAddEventPage(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final double height = data.size.height - data.padding.top;
    final BoxConstraints constraints = BoxConstraints(maxHeight: height);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: constraints,
      builder: (context) => const AddEventPage(),
    );
  }
}

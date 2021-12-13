import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/day_calendar_view.dart';
import 'package:flutter_app/month_calendar_view.dart';
import 'package:flutter_app/week_calendar_view.dart';
import 'package:flutter_app/weekday_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_event_page.dart';
import 'bottom_navigation.dart';
import 'modal_page.dart';

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
        brightness: Brightness.light,
        fontFamily: 'Source Han Sans JP',
        pageTransitionsTheme: _pageTransitionTheme,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Source Han Sans JP',
        pageTransitionsTheme: _pageTransitionTheme,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // TODO: Todayページ実装

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> _children = <Widget>[
      Column(
        children: [
          const WeekdayRow(),
          const MonthCalendarView(),
        ],
      ),
      const WeekCalendarView(),
      const DayCalendarView(),
    ];

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
              onPressed: () {
                fetchEvent();
              },
            ),
          ),
          SizedBox(
            width: 56,
            child: IconButton(
              icon: const Icon(Icons.today),
              onPressed: () => ref.watch(pageControllerProvider),
            ),
          ),
        ],
      ),
      body: _children[ref.watch(bottomNavigationProvider)],
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

  void fetchEvent() async {
    final x = await FirebaseFirestore.instance.collection('users').doc('12345').get();
    print(x.data());
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test_month_calendar_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_navigation.dart';
import 'day_calendar_view.dart';
import 'event_add_page.dart';
import 'modal_page.dart';
import 'month_calendar_view.dart';
import 'utils/utils.dart';
import 'week_calendar_view.dart';
import 'weekday_row.dart';

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

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // TODO: Todayページ実装
  // TODO:  祝日判定の処理の重さ問題

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> _children = <Widget>[
      Column(
        children: const <Widget>[
          const WeekdayRow(),
          //const MonthCalendarView(),
          const TestMonthCalendarView(),
        ],
      ),
      const WeekCalendarView(),
      const DayCalendarView(),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _showModalPage(context),
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
        elevation: 0,
      ),
      body: _children[ref.watch(bottomNavigationProvider)],
      /*
      body: Column(
        children: [
          const WeekdayRow(),
          MonthCalendarView(),
        ],
      ),
      */
      //body: Container(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddEventPage(context),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  BoxConstraints _constraints(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final double height = data.size.height - data.padding.top;
    return BoxConstraints(maxHeight: height);
  }

  void _showModalPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: _constraints(context),
      builder: (context) => const ModalPage(),
    );
  }

  void _showAddEventPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: _constraints(context),
      builder: (context) => const EventAddPage(),
    );
  }

  void fetchEvent() async {
    final x = await FirebaseFirestore.instance.collection('users').doc('12345').get();
    print(x.data());
  }
}

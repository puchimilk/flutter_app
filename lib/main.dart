import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bottom_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calendar.dart';
import 'modal_page.dart';
import 'monthly_page.dart';

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
    
    final PageController controller = ref.watch(pageControllerProvider);
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Source Han Sans JP',
        pageTransitionsTheme: _pageTransitionTheme,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(12),
            onPressed: _onPressedShowModalBottomSheet,
          ),
          title: const Text(
            '2021年12月',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              //fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(12),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.today,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(12),
              //onPressed: () => controller.jumpToPage(initialPage),
              onPressed: () => controller.jumpToPage(Calendar().sample11()),
            ),
          ],
          elevation: 1,
          toolbarHeight: 48,
          leadingWidth: 48,
          backgroundColor: Colors.white,
        ),
        body: MonthlyPage(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

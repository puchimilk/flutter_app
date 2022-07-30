import 'package:flutter_app/importer.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );

  // FirebaseDatabase database = FirebaseDatabase.instance;
  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  // FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = RouteMap(
      routes: {
        '/': (_) => const TabPage(
              child: BaseScreen(),
              paths: ['/calendar', '/todo', '/memo', '/search', '/setting'],
            ),
        '/calendar': (_) => const MaterialPage<dynamic>(
              child: CalendarScreen(),
            ),
        '/calendar/new': (_) => const MaterialPage<dynamic>(
              child: AddCalendarEventScreen(),
            ),
        '/todo': (_) => const MaterialPage<dynamic>(
              child: TodoScreen(),
            ),
        '/todo/new': (_) => const MaterialPage<dynamic>(
              child: AddTodoScreen(),
            ),
        '/memo': (_) => const MaterialPage<dynamic>(
              child: MemoScreen(),
            ),
        '/search': (_) => const MaterialPage<dynamic>(
              child: SearchScreen(),
            ),
        '/setting': (_) => const MaterialPage<dynamic>(
              child: SettingScreen(),
            ),
      },
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: AppColors.darkGrey),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.darkGrey,
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: AppColors.grey,
        ),
        fontFamily: 'Zen Kaku Gothic Antique',
      ),
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
    );
  }
}

// TODO: Todayページ実装
// TODO: 祝日判定の処理の重さ問題

// NOTE: 月間カレンダーのレイヤーについて
// カレンダーを描画する階層
// カレンダーの予定のみ表示する階層
// カレンダーの各日付の選択を制御する階層
// TimeTreeより

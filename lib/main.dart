import '/importer.dart';

Future<void> main() async {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = RouteMap(
      routes: {
        '/': (_) => TabPage(
              child: BaseScreen(),
              paths: ['/calendar', '/todo', '/memo', '/search', '/setting'],
            ),
        '/calendar': (_) => MaterialPage<dynamic>(
              child: CalendarScreen(),
            ),
        '/calendar/new': (_) => MaterialPage<dynamic>(
              child: AddCalendarEventScreen(),
            ),
        '/todo': (_) => MaterialPage<dynamic>(
              child: TodoScreen(),
            ),
        '/todo/new': (_) => MaterialPage<dynamic>(
              child: AddTodoScreen(),
            ),
        '/memo': (_) => MaterialPage<dynamic>(
              child: MemoScreen(),
            ),
        '/search': (_) => MaterialPage<dynamic>(
              child: SearchScreen(),
            ),
        '/setting': (_) => MaterialPage<dynamic>(
              child: SettingScreen(),
            ),
      },
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: AppColors.darkGrey),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.darkGrey,
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: AppColors.grey,
        ),
        fontFamily: 'Zen Kaku Gothic Antique',
      ),
      routeInformationParser: RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
    );
  }
}

// TODO: Todayページ実装
// TODO:  祝日判定の処理の重さ問題

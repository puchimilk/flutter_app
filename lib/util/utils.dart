import '/importer.dart';

DateTime stringToDate(String str) {
  List<String> splitDate = str.split('/');
  int year = int.parse(splitDate[0]);
  int month = int.parse(splitDate[1]);
  int day = int.parse(splitDate[2]);
  return DateTime(year, month, day);
}

ThemeData lightTheme() {
  ThemeData light = ThemeData.light();
  const pageTransitionTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );
  return light.copyWith(
    primaryColor: Colors.white,
    textTheme: light.copyWith().textTheme.apply(
          fontFamily: 'Source Han Sans JP',
        ),
    pageTransitionsTheme: pageTransitionTheme,
  );
}

ThemeData darkTheme() {
  ThemeData dark = ThemeData.dark();
  const pageTransitionTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );
  return dark.copyWith(
    textTheme: dark.copyWith().textTheme.apply(
          fontFamily: 'Source Han Sans JP',
        ),
    pageTransitionsTheme: pageTransitionTheme,
  );
}

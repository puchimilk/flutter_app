import 'package:flutter_app/importer.dart';

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

const br4 = BorderRadius.all(Radius.circular(4));
const br6 = BorderRadius.all(Radius.circular(6));
const br8 = BorderRadius.all(Radius.circular(8));

const pl4 = Padding(padding: EdgeInsets.only(left: 4));
const pl8 = Padding(padding: EdgeInsets.only(left: 8));
const pl12 = Padding(padding: EdgeInsets.only(left: 12));

const pt4 = Padding(padding: EdgeInsets.only(top: 4));
const pt8 = Padding(padding: EdgeInsets.only(top: 8));
const pt12 = Padding(padding: EdgeInsets.only(top: 12));
const pt16 = Padding(padding: EdgeInsets.only(top: 16));
const pt20 = Padding(padding: EdgeInsets.only(top: 20));
const pt24 = Padding(padding: EdgeInsets.only(top: 24));
const pt28 = Padding(padding: EdgeInsets.only(top: 28));
const pt32 = Padding(padding: EdgeInsets.only(top: 32));

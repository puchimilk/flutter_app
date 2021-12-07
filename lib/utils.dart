import 'package:flutter/cupertino.dart';

DateTime stringToDate(String str) {
  List<String> splitDate = str.split('/');
  int year = int.parse(splitDate[0]);
  int month = int.parse(splitDate[1]);
  int day = int.parse(splitDate[2]);
  return DateTime(year, month, day);
}

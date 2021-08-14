import 'package:flutter/material.dart';

List<dynamic> day(DateTime date) {
  var first = DateTime(date.year, date.month, 1);
  var firstWeekday = first.weekday;
  if (firstWeekday == 7) {
    firstWeekday = 0;
  }
  first = DateTime(first.year, first.month, first.day - firstWeekday);
  var last = DateTime(date.year, date.month + 1, 0);
  var lastWeekday = last.weekday;
  if (lastWeekday == 7) {
    lastWeekday = 0;
  }
  last = DateTime(last.year, last.month, last.day + (lastWeekday != 6 ? 6 - lastWeekday : 0));
  final dayCount = last.difference(first).inDays + 1;
  var calendar = [];
  for (var i = 0; i < dayCount; i++) {
    calendar.add(DateTime(first.year, first.month, first.day + i).day);
  }
  return calendar;
}

Color dayOfWeekColor(int index) {
  Color color;
  switch (index % 7) {
    case 0:
      color = Colors.red;
      break;
    case 6:
      color = Colors.blue;
      break;
    default:
      color = Colors.black;
  }
  return color;
}

List<dynamic> month(DateTime date) {
  var first = DateTime(date.year, date.month, 1);
  var firstWeekday = first.weekday;
  if (firstWeekday == 7) {
    firstWeekday = 0;
  }
  first = DateTime(first.year, first.month, first.day - firstWeekday);
  var last = DateTime(date.year, date.month + 1, 0);
  var lastWeekday = last.weekday;
  if (lastWeekday == 7) {
    lastWeekday = 0;
  }
  last = DateTime(last.year, last.month, last.day + (lastWeekday != 6 ? 6 - lastWeekday : 0));
  final dayCount = last.difference(first).inDays + 1;
  var calendar = [];
  for (var i = 0; i < dayCount; i++) {
    calendar.add(DateTime(first.year, first.month, first.day + i).month == date.month ? false : true);
  }
  return calendar;
}

import 'package:flutter/material.dart';

List<dynamic> lastMonth(DateTime date) {
  date = DateTime(date.year, date.month, 1);
  var firstWeekday = date.weekday;
  if (firstWeekday == 7) {
    firstWeekday = 0;
  }
  date = DateTime(date.year, date.month, date.day - firstWeekday);
  var calendar = [];
  for (var i = 0; i < firstWeekday; i++) {
    calendar.add(date.day + i);
  }
  return calendar;
}

List<dynamic> thisMonth(DateTime date) {
  date = DateTime(date.year, date.month, 1);
  var last = DateTime(date.year, date.month + 1, 0);
  var dayCount = last.difference(date).inDays + 1;
  var calendar = [];
  for (var i = 0; i < dayCount; i++) {
    calendar.add(date.day + i);
  }
  return calendar;
}

List<dynamic> nextMonth(DateTime date) {
  date = DateTime(date.year, date.month + 1, 0);
  var lastWeekday = date.weekday;
  if (lastWeekday == 7) {
    lastWeekday = 0;
  }
  var nextMonthDay = 6 - lastWeekday;
  var calendar = [];
  for (var i = 0; i < nextMonthDay; i++) {
    calendar.add(1 + i);
  }
  return calendar;
}

List<dynamic> daySet(DateTime date) {
  var calendar = [];
  calendar.addAll(lastMonth(date));
  calendar.addAll(thisMonth(date));
  calendar.addAll(nextMonth(date));
  return calendar;
}

Color dayWeekColor(int i) {
  Color color;
  switch (i % 7) {
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

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

Color weekdayColor(int index) {
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

int monthNumber(DateTime first, DateTime last) {
  var yearNumber = last.year - first.month;
  var monthNumber = last.month - first.month;
  return yearNumber * 12 + monthNumber;
}

bool? isLeapYear(int year) {
  if ((year % 4 == 0 && year % 100 == 0) || year % 400 == 0) {
    // うるう年
    return true;
  } else {
    // 平年
    return false;
  }
}

final firstDayOfWeek = StartingWeekday.sunday;

enum StartingWeekday {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday
}

DateTime firstDayOfMonth(DateTime month) {
  return DateTime.utc(month.year, month.month, 1);
}

DateTime lastDayOfMonth(DateTime month) {
  return DateTime.utc(month.year, month.month + 1, 0);
}

DateTime getFirstDayOfWeek(DateTime week) {
  final weekday = week.weekday;
  final x = weekday - getWeekdayNumber(firstDayOfWeek); 
  final y = x % 7;
  return week.subtract(Duration(days: y));
}

DateTime getLastDayOfWeek(DateTime week) {
  final weekday = week.weekday;
  final x = 6 - weekday + getWeekdayNumber(firstDayOfWeek);
  final y = x % 7;
  return week.add(Duration(days: y));
}

int getWeekdayNumber(StartingWeekday weekday) {
  return StartingWeekday.values.indexOf(weekday);
}

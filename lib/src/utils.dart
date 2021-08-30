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


int firstWeekday = 1;

DateTime firstDayOfMonth(DateTime date) {
  return DateTime(date.year, date.month, 1);
}

DateTime lastDayOfMonth(DateTime date) {
  return DateTime(date.year, date.month + 1, 0);
}

// firstWeekdayで指定した曜日を元に週の始めを求める
DateTime firstDayOfWeek(DateTime date) {
  var weekday = DateTime(date.year, date.month, date.day).weekday;
  var calculate = -(weekday - firstWeekday);
  if (weekday < firstWeekday) {
    calculate -= 7;
  }
  DateTime firstDayOfWeek = DateTime(date.year, date.month, date.day + calculate);
  return firstDayOfWeek;
}

// firstWeekdayで指定した曜日を元に週の終わりを求める
DateTime lastDayOfWeek(DateTime date) {
  var weekday = DateTime(date.year, date.month, date.day).weekday;
  var calculate = -(weekday - firstWeekday) + 6;
  if (weekday < firstWeekday) {
    calculate -= 7;
  }
  DateTime lastDayOfWeek = DateTime(date.year, date.month, date.day + calculate);
  return lastDayOfWeek;
}

// firstWeekdayで指定した曜日を元に週の中心を求める
DateTime middleDayOfWeek(DateTime date) {
  var weekday = DateTime(date.year, date.month, date.day).weekday;
  var calculate = -(weekday - firstWeekday) + 3;
  if (weekday < firstWeekday) {
    calculate -= 7;
  }
  var middleDayOfWeek = DateTime(date.year, date.month, date.day + calculate);
  return middleDayOfWeek;
}

int numberOfDaysInMonth(DateTime date) {
  return DateUtils.getDaysInMonth(date.year, date.month);
}

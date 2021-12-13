import 'dart:typed_data';

import 'package:charset_converter/charset_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/utils.dart';

enum StartingWeekday {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

class Calendar {
  Calendar({
    this.startWeekday = StartingWeekday.sunday,
  });

  final DateTime startDate = DateTime(1970, 01, 01);
  final DateTime endDate = DateTime(2099, 12, 31);
  final DateTime currentDate = DateTime.now();
  StartingWeekday startWeekday;

  static DateTime firstDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  static DateTime lastDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }

  DateTime firstDayOfWeek(DateTime date) {
    final int weekday = date.weekday;
    final int days = ((7 + weekday) - startWeekday.index) % 7;
    return date.subtract(Duration(days: days));
  }

  DateTime lastDayOfWeek(DateTime date) {
    final int weekday = date.weekday;
    final int days = ((7 + weekday) + startWeekday.index) % 7;
    return date.add(Duration(days: days));
  }

  int monthCount() {
    return DateUtils.monthDelta(startDate, endDate);
  }

  int startingWeekdayNumber() {
    return startWeekday.index;
  }

  int beforeDays(DateTime date) {
    final weekday = date.weekday;
    return ((7 + weekday) - startingWeekdayNumber()) % 7;
  }

  int afterDays(DateTime date) {
    final weekday = date.weekday;
    return ((startingWeekdayNumber() - weekday) + 6) % 7;
  }

  int gridCount(DateTime date) {
    final firstDay = firstDayOfMonth(date);
    final lastDay = lastDayOfMonth(date);
    final before = beforeDays(firstDay);
    final after = afterDays(lastDay);
    return DateUtils.getDaysInMonth(date.year, date.month) + before + after;
  }

  int weeksCount(int gridCount) {
    switch (gridCount) {
      case 28:
        return 4;
      case 42:
        return 6;
      default:
        return 5;
    }
  }

  List<DateTime> dateList(DateTime date) {
    final dayCount = gridCount(date);
    final first = firstDayOfMonth(date);
    final days = beforeDays(first);
    final start = first.subtract(Duration(days: days));
    List<DateTime> list = <DateTime>[];
    for (var i = 0; i < dayCount; i++) {
      final day = start.add(Duration(days: i));
      list.add(day);
    }
    return list;
  }

  List<int> days(List<DateTime> dates) {
    List<int> list = <int>[];
    for (var i = 0; i < dates.length; i++) {
      list.add(dates[i].day);
    }
    return list;
  }

  // ページの位置から月を割り出す
  DateTime monthPosition(int page) {
    return DateTime(startDate.year, startDate.month + page);
  }

  // 月のマスから日にちを割り出す
  DateTime dayPosition(int page, int grid) {
    final p = monthPosition(page);
    return dateList(p)[grid];
  }

  int currentMonth() {
    final year = (currentDate.year - 1970) * 12;
    final month = currentDate.month;
    return (year + month) - 1;
  }

  bool isToday(int page, int grid) {
    final dateB = dayPosition(page, grid);
    final isSameToday = DateUtils.isSameDay(currentDate, dateB);
    if (isSameToday) {
      return true;
    }
    
    return false;
  }

  bool isThisMonth(int page, int grid) {
    final dateA = monthPosition(page);
    final p = monthPosition(page);
    final dateB = dateList(p)[grid];
    final isMonth = DateUtils.isSameMonth(dateA, dateB);
    if (isMonth) {
      return true;
    }
    return false;
  }

  Future<List<DateTime>> _loadCsv() async {
    final ByteData byteData = await rootBundle.load('assets/syukujitsu.csv');
    final Uint8List uint8list = byteData.buffer.asUint8List();
    final String? decode = await CharsetConverter.decode('cp932', uint8list);
    final String trim = decode!.trim();

    List<DateTime> list = [];
    for (String line in trim.split('\r\n')) {
      List<String> rows = line.split(',');
      if (rows[0] == '国民の祝日・休日月日' && rows[1] == '国民の祝日・休日名称') continue;
      DateTime date = stringToDate(rows[0]);
      list.add(date);
    }
    return list;
  }

  Future<bool> isHoliday(DateTime date) async {
    final List<DateTime> result = await _loadCsv();
    for (var i = 0; i < result.length; i++) {
      if (DateUtils.isSameDay(result[i], date)) {
        return true;
      } else {
        continue;
      }
    }
    return false;
  }
}

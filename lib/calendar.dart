import 'package:flutter/material.dart';

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

  DateTime startDate = DateTime(1970, 01, 01);
  DateTime endDate = DateTime(2099, 12, 31);
  DateTime currentDate = DateTime.now();
  StartingWeekday startWeekday;

  DateTime firstDayOf(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  DateTime lastDayOfM(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }

  DateTime firstDayOfWeek(DateTime date) {
    var weekday = date.weekday;
    var days = ((7 + weekday) - startWeekday.index) % 7;
    return date.subtract(Duration(days: days));
  }

  DateTime lastDayOfWeek(DateTime date) {
    var weekday = date.weekday;
    var days = ((7 + weekday) + startWeekday.index) % 7;
    return date.add(Duration(days: days));
  }

  int abc(int page) {
    var baseDate = DateTime(startDate.year, startDate.month + page, 1);
    var first = (firstDayOf(baseDate).weekday + 7) % 7;
    var last = lastDayOfM(baseDate).day;
    if (first + last > 35) {
      return 42;
    } else {
      return 35;
    }
  }

  List<int> bcd(int page) {
    var list = <int>[];

    var before = DateTime(startDate.year, startDate.month + page, 1);
    var beforeWeekday = before.weekday;
    if (beforeWeekday == 7) beforeWeekday = 0;
    for (var i = 0; i < beforeWeekday; i++) {
      var base = before.subtract(Duration(days: beforeWeekday));
      list.add(base.day + i);
    }

    var dayCount = DateUtils.getDaysInMonth(before.year, before.month);

    for (var i = 0; i < dayCount; i++) {
      list.add(1 + i);
    }

    var after = DateTime(before.year, before.month + 1, 1);
    var afterWeekday = after.weekday;
    if (afterWeekday == 7) afterWeekday = 0;
    for (var i = 0; i < afterWeekday; i++) {
      var base = DateTime(after.year, after.month, after.day + i);
      list.add(base.day);
    }

    return list;
  }

  int monthCount() {
    return DateUtils.monthDelta(startDate, endDate);
  }

  // 表示するカレンダーの最初の日と最後の日
  /*
  var a = DateTime(2021, 11, 1);
  var b = DateTime(2021, 12, 5);
  var c = b.difference(a).inDays + 1;
  var d = c / 7;
  */

  int startingWeekdayNumber() {
    return startWeekday.index;
  }

  DateTime firstDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  DateTime lastDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
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
    var list = <DateTime>[];
    for (var i = 0; i < dayCount; i++) {
      final day = start.add(Duration(days: i));
      list.add(day);
    }
    return list;
  }

  List<int> days(List<DateTime> dates) {
    var list = <int>[];
    for (var i = 0; i < dates.length; i++) {
      list.add(dates[i].day);
    }
    return list;
  }

  // ページの位置から月を割り出す
  DateTime sample9(int page) {
    return DateTime(startDate.year, startDate.month + page);
  }

  // 月のマスから日にちを割り出す
  DateTime sample10(int page, int grid) {
    final p = sample9(page);
    return dateList(p)[grid];
  }

  int sample11() {
    final year = (currentDate.year - 1970) * 12;
    final month = currentDate.month;
    return (year + month) - 1;
  }

  bool sample12(int page, int grid) {
    final dateB = sample10(page, grid);
    final isToday = DateUtils.isSameDay(currentDate, dateB);
    if (isToday) {
      return true;
    }
    return false;
  }

  bool sample13(int page, int grid) {
    final dateA = sample9(page);
    final p = sample9(page);
    final dateB = dateList(p)[grid];
    final isMonth = DateUtils.isSameMonth(dateA, dateB);
    if (isMonth) {
      return true;
    }
    return false;
  }

  bool isHoliday(DateTime date) {
    // 1970年以降
    // 振替休日をどうするか

    // 元日
    if (date.month == 1 && date.day == 1) return true;
    // 成人式
    if (date.year <= 1999) {
      // 1999年以前
      if (date.month == 1 && date.day == 15) return true;
    } else if (date.year >= 2000) {
      // 2000年以降
      // 1月の第2月曜日
    }
    // 建国記念日
    if (date.year >= 1967 && date.month == 2 && date.day == 11) return true;
    // 天皇誕生日
    if (date.year <= 1989 && date.month == 4 && date.day == 29) {
      // 1989年以前
      return true;
    } else if (date.year <= 2019 && date.month == 12 && date.day == 23) {
      // 2019年以前
      return true;
    } else if (date.year >= 2020 && date.month == 2 && date.day == 23) {
      // 2020年以前
      return true;
    }
    // 春分の日

    // みどりの日
    // 1989年以降
    if (date.year >= 1989) {
      // 2006年以前
      if (date.year <= 2006) {
        if (date.month == 4 && date.day == 29) return true;
      }
      // 2007年以降
      if (date.year >= 2007) {
        if (date.month == 5 && date.day == 4) return true;
      }
    }
    // 昭和の日
    if (date.year >= 2007 && date.month == 4 && date.day == 29) return true;
    // 憲法記念日
    if (date.month == 5 && date.day == 3) return true;
    // こどもの日
    if (date.month == 5 && date.day == 5) return true;
    // 海の日
    // 1996年以降
    if (date.year >= 1996) {
      if (date.year <= 2002) {
        if (date.month == 7 && date.day == 20) return true;
      }
      if (date.year >= 2003) {
        // 7月第3月曜日
      }
    }
    // 山の日
    if (date.year >= 2016 && date.month == 8 && date.day == 11) return true;
    // 敬老の日
    if (date.year >= 1966) {
      if (date.year <= 2002) {
        if (date.month == 9 && date.day == 15) return true;
      }
      if (date.year >= 2003) {
        // 9月の第3月曜日
      }
    }
    // 秋分の日

    // 体育の日・スポーツの日
    // 1966年以降
    if (date.year >= 1966) {
      // 1999年以前
      if (date.year <= 1999) {
        if (date.month == 10 && date.day == 10) return true;
      }
      // 2000年以降
      if (date.year >= 2000) {
        // 2019年以前
        if (date.year <= 2019) {
          // 10月の第2月曜日
        }
      }
      // スポーツの日
      if (date.year >= 2020) {
        // 10月の第2月曜日
      }
    }
    // 文化の日
    if (date.month == 11 && date.day == 3) return true;
    // 勤労感謝の日
    if (date.month == 11 && date.day == 23) return true;
    // 振替休日
    if (date.year >= 1973) {}
    // 国民の休日
    if (date.year >= 1988) {}

    return false;
  }

  int locationWeekday(DateTime date) {
    final week = ((date.day + 6) / 7).floor();
    return week;
  }

  anyLocationWeekday(DateTime date, int count, int weekday) {
    // 第n曜日を求めたい
    final first = firstDayOfMonth(date);
    final week = ((first.day + 6) / 7).floor();
    debugPrint('$week');
    return DateTime(0);
  }
}

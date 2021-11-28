import 'package:flutter/material.dart';

class CalendarRange {
  CalendarRange({
    this.month,
    this.year,
    this.daysInMonth,
  });
  
  final int? month;
  final int? year;
  final int? daysInMonth;
}

List<CalendarRange> getCalendarRange(DateTime startDate, DateTime endDate) {
  startDate = DateTime(startDate.year, startDate.month, startDate.day - startDate.weekday);
  final monthCount = DateUtils.monthDelta(startDate, endDate);
  var result = <CalendarRange>[];
  for (var i = 0; i < monthCount; i++) {
    final dateToAdd = DateTime(startDate.year, startDate.month, startDate.day).add(Duration(days: i));
    result.add(
      CalendarRange(
        year: dateToAdd.year,
        month: dateToAdd.month,
        daysInMonth: dateToAdd.day,
      ),
    );
  }
  return result;
}

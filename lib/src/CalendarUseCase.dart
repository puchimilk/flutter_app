import 'package:flutter/material.dart';
import 'package:flutter_app/src/MonthCalendarView.dart';

bool isLeapYear(int year) => year % 400 == 0 || (year % 4 == 0 && year % 100 != 0);

int zellerCongruence(int year, int month, int day) {
  return DateTime(year, month, day).weekday;
}

dayOfWeek(int year, int month, int day) {
  var x = DateTime(year, month, day).weekday;
  if (x == 7) {
    x = 0;
  }
  return x;
}

bool conditionFourWeeks(int year, int month) {
  final firstDayOfWeek = dayOfWeek(year, month, 1);
  return !isLeapYear(year) && month == 2 && (firstDayOfWeek == 0);
}

int numberOfDays(int year, int month) {
  if (conditionFourWeeks(year, month)) {
    return 4;
  } else if (conditionSixWeeks(year, month)) {
    return 5;
  } else {
    return 6;
  }
}

bool conditionSixWeeks(int year, int month) {
  final firstDayOfWeek = dayOfWeek(year, month, 1);
  final days = numberOfDays(year, month);
  return (firstDayOfWeek == 6 && days == 30) || (firstDayOfWeek >= 5 && days == 31);
}

class CalendarViewController {
  final weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  
  CalendarViewController();
  
  Color dayOfWeekColor(int length) {
    Color color;
    
    switch (length % 7) {
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
}

class CalendarUseCase extends StatefulWidget {
  CalendarUseCase({
    Key? key
  });
  
  @override
  _CalendarUseCase createState() => _CalendarUseCase();
}

class _CalendarUseCase extends State<CalendarUseCase> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

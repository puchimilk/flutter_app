import 'package:flutter/material.dart';

class MonthView {
  MonthView({
    this.startDate,
    this.endDate,
  });
  
  final DateTime? startDate;
  final DateTime? endDate;
  
  String dateFormat(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
  
  DateTime getStartDate(DateTime date) {
    date = DateTime(date.year, date.month, 1);
    var weekNumber = date.weekday;
    if (weekNumber == 7) {
      weekNumber = 0;
    }
    var subtract = DateTime(date.year, date.month, date.day - weekNumber);
    return subtract;
  }
  
  DateTime getEndDate(DateTime date) {
    date = DateTime(date.year, date.month + 1, 0);
    var weekNumber = date.weekday;
    if (weekNumber == 7) {
      weekNumber = 0;
    }
    var subtract = DateTime(date.year, date.month, date.day + (weekNumber != 6 ? 6 - weekNumber : 0));
    return subtract;
  }
  
  getCalendar(DateTime date) {
    var start = getStartDate(date);
    var end = getEndDate(date);
    var weekNumber = ((end.difference(start).inDays + 1) / 7).floor();
    var calendar = [];
    for (var i = 0; i < weekNumber; i++) {
      var weekRow = [];
      for (var i = 0; i < 7; i++) {
        var _start = DateTime(start.year, start.month, start.day + i);
        weekRow.add({'date' : _start.day});
      }
      start = start.add(Duration(days: 7));
      calendar.add(weekRow);
    }
    return calendar;
  }
  
  Widget build(BuildContext context) {
    final controller = PageController();
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              Size size = Size(constrains.maxWidth, constrains.maxHeight);
              return Wrap(
                children: List.generate(7, (index) {
                  return SizedBox(
                    width: size.width,
                    height: size.height,
                    child: GestureDetector(
                      child: Container(
                        child: Text(
                          '$index',
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }
}

class Event {
  Event({
    this.id,
  });
  
  int? id;
  String? title;
  String? startDate;
  String? endDate;
  Color? color;
  
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id' : id,
      'title' : title,
      'startDate' : startDate,
      'endDate' : endDate,
      'color' : color,
    };
    return map;
  }
}
import 'package:flutter/material.dart';

class MonthView extends StatefulWidget {
  MonthView({
    this.startDate,
  });
  
  final DateTime? startDate;
  
  _MonthView createState() => _MonthView();
  
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
  
  test1(DateTime start, DateTime end, int index) {
    start = DateTime(start.year, start.month + index, 1);
    var startWeekday = start.weekday;
    if (startWeekday == 7) {
      startWeekday = 0;
    }
    start = DateTime(start.year, start.month, start.day - startWeekday);
    end = DateTime(end.year, end.month + index + 1, 0);
    var endWeekday = end.weekday;
    if (endWeekday == 7) {
      endWeekday = 0;
    }
    end = DateTime(end.year, end.month, end.day + (endWeekday != 6 ? 6 - endWeekday : 0));
    final dayCount = end.difference(start).inDays + 1;
    var calendar = [];
    for (var i = 0; i < dayCount; i++) {
      var _start = DateTime(start.year, start.month, start.day + i);
      calendar.add(_start.day);
    }
    return calendar;
  }
}

class _MonthView extends State<MonthView> {
  Widget build(BuildContext context) {
    final controller = PageController();
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          var pageIndex = index;
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              Size size = Size(constrains.maxWidth, constrains.maxHeight);
              return Wrap(
                children: List.generate(35, (index) {
                  return SizedBox(
                    width: size.width / 7,
                    height: size.height / 5,
                    child: GestureDetector(
                      child: Container(
                        child: Text(
                          widget.test1(
                            widget.startDate!,
                            widget.startDate!,
                            pageIndex
                          )[index].toString(),
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
        itemCount: 2399,
      ),
    );
  }
}

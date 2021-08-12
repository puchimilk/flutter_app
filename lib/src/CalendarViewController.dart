import 'package:flutter/material.dart';
import 'utils.dart';

class MonthView extends StatefulWidget {
  MonthView({
    this.startDate,
  });
  
  final DateTime? startDate;
  
  _MonthView createState() => _MonthView();
  
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

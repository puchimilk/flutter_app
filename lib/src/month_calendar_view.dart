import 'package:flutter/material.dart';

class MonthCalendarView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    
    return PageView.builder(
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        final date = [];
        final base = DateTime(1900, 01, 01);
        // 今月の初日
        final first = DateTime(base.year, base.month + index, 1);
        var firstWeekday = first.weekday;
        if (firstWeekday == 7) {
          firstWeekday = 0;
        }
        // 今月の最終日
        final last = DateTime(first.year, first.month + 1, 0);
        var lastWeekday = last.weekday;
        if (lastWeekday == 7) {
          lastWeekday = 0;
        }
        // 先月の最終日
        final lastMonth = DateTime(base.year, base.month + index, 0);
        var lastMonthWeekday = lastMonth.weekday;
        if (lastMonthWeekday == 7) {
          lastMonthWeekday = 0;
        }
        // 来月の初日
        final nextMonth = DateTime(base.year, base.month + 1 + index, 1);
        var nextMonthWeekday = nextMonth.weekday;
        if (nextMonthWeekday == 7) {
          nextMonthWeekday = 0;
        }
        // 先月の日にち
        if (firstWeekday != 0) {
          for (var i = 0; i < firstWeekday; i++) {
            var reverse = lastMonth.day - lastMonthWeekday;
            date.add(reverse + i);
          }
        }
        // 今月の日にち
        for (var i = 0; i < last.day; i++) {
          date.add(first.day + i);
        }
        // 来月の日にち
        if (lastWeekday != 6) {
          for (var i = 0; i < (6 - lastWeekday); i++) {
            date.add(nextMonth.day + i);
          }
        }
        
        return Column(
          children: [
            Container(
              child: Text(
                '${first.year}年${first.month}月',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size size = Size(constraints.maxWidth, constraints.maxHeight);
                  var dateLength = date.length;
                  var rowNum = 5;
                  if (dateLength == 42) {
                    rowNum = 6;
                  }
                  
                  return Wrap(
                    children: List.generate(dateLength, (index) {
                      
                      return SizedBox(
                        width: size.width / 7,
                        height: size.height / rowNum,
                        child: GestureDetector(
                          child: Container(
                            child: Text(
                              '${date[index]}',
                            ),
                          ),
                          onTap: () {
                            _showDialog(context);
                          },
                        ),
                      );
                    }),
                  );
                }
              ),
            ),
          ],
        );
      },
      itemCount: 1200,
    );
  }
  
  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            Text('Hey!'),
          ],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            )
          ),
        );
      },
    );
  }
}
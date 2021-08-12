import 'package:flutter/material.dart';
import 'utils.dart';

class MonthCalendarView extends StatefulWidget {
  MonthCalendarView({
    Key? key,
  })  : super(key: key);
  
  _MonthCalendarView createState() => _MonthCalendarView();
}

class _MonthCalendarView extends State<MonthCalendarView> {
  int? _selectedIndex;
  
  void _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  var _list = [];
  
  void _counter(int index) {
    setState(() {
      _list.add(index);
      if (_list.length > 2) {
        _list.removeAt(0);
      }
      if (_list.length == 2 && _list[0] == _list[1]) {
        showCalendarDialog(context);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          final date = [];
          final dateYear = [];
          final dateMonth = [];
          final dateDay = [];
          final base = DateTime(1900, 01, 01);
          // 今月の初日
          final first = DateTime(base.year, base.month + index, 1);
          var firstWeekdayday = first.weekday;
          if (firstWeekdayday == 7) {
            firstWeekdayday = 0;
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
          if (firstWeekdayday != 0) {
            for (var i = 0; i < firstWeekdayday; i++) {
              var reverse = lastMonth.day - lastMonthWeekday;
              date.add(reverse + i);
              dateYear.add(lastMonth.year);
              dateMonth.add(lastMonth.month);
              dateDay.add(lastMonth.day + i);
            }
          }
          // 今月の日にち
          for (var i = 0; i < last.day; i++) {
            date.add(first.day + i);
            dateYear.add(first.year);
            dateMonth.add(first.month);
            dateDay.add(first.day + i);
          }
          // 来月の日にち
          if (lastWeekday != 6) {
            for (var i = 0; i < (6 - lastWeekday); i++) {
              date.add(nextMonth.day + i);
              dateYear.add(nextMonth.year);
              dateMonth.add(nextMonth.month);
              dateDay.add(nextMonth.day + i);
            }
          }
          
          dateBox(int index) {
            Map<String, int> maps = {
              'year' : dateYear[index],
              'month' : dateMonth[index],
              'day' : dateDay[index],
            };
            return maps;
          }
          
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              Size size = Size(constraints.maxWidth, constraints.maxHeight);
              
              var height = 5;
              if (date.length == 42) {
                height = 6;
              }
              
              return Wrap(
                children: List.generate(date.length, (int index) {
                  return SizedBox(
                    width: size.width / 7,
                    height: size.height / height,
                    child: GestureDetector(
                      child: Container(
                        color: _selectedIndex == index
                            ? Colors.black12
                            : Colors.transparent,
                        child: Text(
                          '${date[index]}',
                          style: TextStyle(
                            color: dayWeekColor(index),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onTap: () async {
                        _onSelected(index);
                        _counter(index);
                        print(dateBox(index));
                      },
                    ),
                  );
                }),
              );
            },
          );
        },
        itemCount: 1200,
      ),
    );
  }
  
  Future<void> showCalendarDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          child: Container(),
        );
      },
    );
  }
}

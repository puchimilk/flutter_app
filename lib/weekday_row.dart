import 'package:flutter/material.dart';

import 'calendar.dart';

class WeekdayRow extends StatelessWidget {
  const WeekdayRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Calendar _calendar = Calendar();

    Color _weekdayColor(int index) {
      int sat = ((index + 1) + _calendar.startingWeekdayNumber()) % 7;
      int sun = (index + _calendar.startingWeekdayNumber()) % 7;
      if (sun == 0) {
        return Color(0xFFe8383d);
      } else if (sat == 0) {
        return Color(0xFF00afcc);
      }
      return Colors.black;
    }

    List<String> _weekdays() {
      const List<String> weekday = ['日', '月', '火', '水', '木', '金', '土'];
      for (var i = 0; i < _calendar.startingWeekdayNumber(); i++) {
        String value = weekday[0];
        weekday.removeAt(0);
        weekday.add(value);
      }
      return weekday;
    }

    return ConstrainedBox(
      constraints: const BoxConstraints.expand(height: 24),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size size = Size(constraints.maxWidth / 7, constraints.maxHeight);
          return Wrap(
            children: List.generate(7, (index) {
              return Container(
                width: size.width,
                height: size.height,
                alignment: Alignment.center,
                child: Text(
                  _weekdays()[index],
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.2,
                    color: _weekdayColor(index),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

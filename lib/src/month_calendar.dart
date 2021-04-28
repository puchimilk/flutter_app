import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MonthCalendar extends StatefulWidget {
  _MonthCalendarState createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  GlobalKey key = GlobalKey();
  OverlayEntry overlayEntry;

  void initState() {
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
    overlayEntry = OverlayEntry(
      opaque: false,
      builder: (context) => calendar(context),
    );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(overlayEntry);
    });
    super.initState();
  }

  void dispose() {
    overlayEntry.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        key: key,
      ),
    );
  }

  Widget calendar(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );

    final RenderBox renderBox = key.currentContext.findRenderObject();
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return Stack(
      children: [
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (BuildContext context, int i) {
                var calendar = [];
                // ベース
                final base = DateTime(1900, 01, 01);
                // 今月の初日
                final firstday = DateTime(base.year, base.month + i, 1);
                var firstdayWeekday = firstday.weekday;
                if (firstdayWeekday == 7) {
                  firstdayWeekday = 0;
                }
                // 先月の最終日
                final lastdayLastmonth =
                    DateTime(firstday.year, firstday.month, 0);
                var lastdayLastmonthWeekday = lastdayLastmonth.weekday;
                if (lastdayLastmonthWeekday == 7) {
                  lastdayLastmonthWeekday = 0;
                }
                // 先月の日にちを追加
                for (var i = 0; i < firstday.weekday; i++) {
                  if (firstdayWeekday != 0) {
                    var reverseDay =
                        lastdayLastmonth.day - lastdayLastmonthWeekday;
                    calendar.add(reverseDay + i);
                  }
                }
                // 今月の最終日
                final lastday = DateTime(base.year, base.month + i + 1, 0);
                // 今月の最終日の曜日
                var lastdayWeekday = lastday.weekday;
                if (lastdayWeekday == 7) {
                  lastdayWeekday = 0;
                }
                // 今月の日にちを追加
                for (var i = 0; i < lastday.day; i++) {
                  calendar.add(firstday.day + i);
                }
                final d = DateTime(base.year, base.month + i, 1);
                // 来月の日にちを追加
                for (var i = 0; i < 6 - lastdayWeekday; i++) {
                  if (lastdayWeekday != 6) {
                    calendar.add(d.day + i);
                  }
                }

                return Material(
                  color: Colors.transparent,
                  child: Wrap(
                    children: List.generate(calendar.length, (i) {
                      int weekNumber;
                      if (calendar.length == 35) {
                        weekNumber = 5;
                      } else if (calendar.length == 42) {
                        weekNumber = 6;
                      }

                      return GestureDetector(
                        child: Container(
                          width: size.width / 7,
                          height: size.height / weekNumber,
                          child: Text(
                            '${calendar[i]}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      );
                    }),
                  ),
                );
              },
              itemCount: 100,
            ),
          ),
        ),
      ],
    );
  }
}

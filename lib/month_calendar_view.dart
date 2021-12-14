import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calendar.dart';

final pageControllerProvider = Provider<PageController>((ref) {
  final int initialPage = Calendar().currentMonth();
  return PageController(initialPage: initialPage);
});

class MonthCalendarView extends ConsumerWidget {
  const MonthCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build is MonthCalendarView');
    final ThemeData theme = Theme.of(context);

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

    Future<Color> _holidayColor(int page, int grid) async {
      int sat = ((grid + 1) + _calendar.startingWeekdayNumber()) % 7;
      int sun = (grid + _calendar.startingWeekdayNumber()) % 7;
      final sample10 = _calendar.dayPosition(page, grid);
      final holiday = await _calendar.isHoliday(sample10);
      bool thisMonth = _calendar.isThisMonth(page, grid);
      if (thisMonth && sun == 0 || thisMonth && holiday) {
        return Color(0xFFe8383d);
      } else if (thisMonth && sat == 0) {
        return Color(0xFF00afcc);
      } else if (thisMonth) {
        return theme.textTheme.bodyText1!.color!;
      }
      return Colors.grey;
    }

    List<String> _weekdays() {
      List<String> weekday = ['日', '月', '火', '水', '木', '金', '土'];
      for (var i = 0; i < _calendar.startingWeekdayNumber(); i++) {
        String value = weekday[0];
        weekday.removeAt(0);
        weekday.add(value);
      }
      return weekday;
    }

    List<Widget> _listTile = <Widget>[
      ListTile(
        leading: const Icon(Icons.calendar_today),
        title: const Text('カレンダー'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          debugPrint('カレンダー');
        },
      ),
    ];

    void _showSettingBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.945,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          debugPrint('closed');
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        '設定',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(
                        width: 48,
                        height: 48,
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 32,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: const Text(
                        '設定',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: _listTile,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.transparent,
      );
    }

    Widget _today(int page, int grid) {
      final result12 = _calendar.isToday(page, grid);
      if (result12) {
        return Center(
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.greenAccent,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
        );
      } else {
        return Container();
      }
    }

    Color _thisMonth1(int page, int grid) {
      final result13 = _calendar.isThisMonth(page, grid);
      if (result13) {
        return Colors.transparent;
      } else {
        return Colors.black12;
      }
    }

    void _showEventList(DateTime date) {
      debugPrint('$dateを受け取りました');
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  '${date.year}年${date.month}月${date.day}日',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Expanded(
      child: PageView.builder(
        controller: ref.watch(pageControllerProvider),
        itemBuilder: (BuildContext context, int pageIndex) {
          final DateTime monthPosition = _calendar.monthPosition(pageIndex);
          final int gridCount = _calendar.gridCount(monthPosition);
          final List<DateTime> dateList = _calendar.dateList(monthPosition);
          final List<int> days = _calendar.days(dateList);

          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return GridView.count(
                crossAxisCount: 7,
                children: List.generate(gridCount, (gridIndex) {
                  return GestureDetector(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          _today(pageIndex, gridIndex),
                          Center(
                            child: FutureBuilder(
                              future: _holidayColor(pageIndex, gridIndex),
                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                return Text(
                                  days[gridIndex].toString(),
                                  style: TextStyle(
                                    color: snapshot.data,
                                    height: 1.4,
                                    fontSize: 12,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      final sample10 = _calendar.dayPosition(pageIndex, gridIndex);
                      debugPrint('$sample10');
                      _calendar.isHoliday(sample10).then((value) {
                        final holiday = value ? '祝日です' : '祝日ではありません';
                        debugPrint('$holiday');
                      });
                      _showBottomSheet(context);
                    },
                  );
                }),
              );
            },
          );
        },
        itemCount: _calendar.monthCount(),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints.expand(height: 300),
      backgroundColor: theme.primaryColor,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0000年00月00日 月曜日',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '大安',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              ListView(
                padding: EdgeInsets.only(top: 16),
                shrinkWrap: true,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 48,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('12:00', style: TextStyle(fontSize: 12)),
                              Text('13:00', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 4, bottom: 4, left: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.amber,
                                  width: 6,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '映画',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  'TOHOシネマ なんば',
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 48,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('終日', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 4, bottom: 4, left: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.pink,
                                  width: 6,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '映画',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  'TOHOシネマ なんば',
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

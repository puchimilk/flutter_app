import 'package:flutter/material.dart';
import 'package:flutter_app/weekday_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calendar.dart';

final pageControllerProvider = Provider((_) => PageController(initialPage: Calendar().sample11()));

class MonthCalendarView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController _controller = ref.watch(pageControllerProvider);

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
      final sample10 = _calendar.sample10(page, grid);
      final holiday = await _calendar.isHoliday(sample10);
      bool thisMonth = _calendar.isThisMonth(page, grid);
      if (thisMonth && sun == 0 || thisMonth && holiday) {
        return Color(0xFFe8383d);
      } else if (thisMonth && sat == 0) {
        return Color(0xFF00afcc);
      } else if (thisMonth) {
        return Colors.black;
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
      showModalBottomSheet<void>(
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
      final result12 = _calendar.sample12(page, grid);
      if (result12) {
        return Center(
          child: Container(
            width: 20,
            height: 20,
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

    return Column(
      children: <Widget>[
        const WeekdayRow(),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int pageIndex) {
              final sample9 = _calendar.sample9(pageIndex);
              final sample5 = _calendar.gridCount(sample9);
              //final sample6 = calendar.sample6(sample5);
              final sample7 = _calendar.dateList(sample9);
              final sample8 = _calendar.days(sample7);
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  //Size size = Size(constraints.maxWidth / 7, constraints.maxHeight / sample6);
                  return GridView.count(
                    crossAxisCount: 7,
                    //childAspectRatio: size.width / size.height,
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(sample5, (gridIndex) {
                      return GestureDetector(
                        child: Container(
                          //color: thisMonth1(pageIndex, gridIndex),
                          child: Stack(
                            children: <Widget>[
                              _today(pageIndex, gridIndex),
                              Center(
                                child: FutureBuilder(
                                  future: _holidayColor(pageIndex, gridIndex),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    return Text(
                                      sample8[gridIndex].toString(),
                                      style: TextStyle(
                                        color: snapshot.data,
                                        height: 1.2,
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
                          final sample10 = _calendar.sample10(pageIndex, gridIndex);
                          debugPrint('$sample10');
                          _calendar.isHoliday(sample10).then((value) {
                            final holiday = value ? '祝日です' : '祝日ではありません';
                            debugPrint('$holiday');
                          });
                        },
                      );
                    }),
                  );
                },
              );
            },
            itemCount: _calendar.monthCount(),
          ),
        ),
      ],
    );
  }
}

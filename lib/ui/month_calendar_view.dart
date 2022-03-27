import 'package:flutter_app/importer.dart';

// final pageControllerProvider = StateProvider.autoDispose((ref) {
//   final int initialPage = Calendar().currentMonth();
//   return PageController(initialPage: initialPage);
// });

class MonthCalendarView extends StatelessWidget {
  const MonthCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build is MonthCalendarView');
    final ThemeData theme = Theme.of(context);
    final Calendar calendar = Calendar();
    final int itemCount = Calendar().monthCount();
    // final PageController controller = ref.watch(pageControllerProvider);
    final ValueNotifier<int> onPageChanged = ValueNotifier<int>(0);

    Color _weekdayColor(int index) {
      int sat = ((index + 1) + calendar.startingWeekdayNumber()) % 7;
      int sun = (index + calendar.startingWeekdayNumber()) % 7;
      if (sun == 0) {
        return const Color(0xFFe8383d);
      } else if (sat == 0) {
        return const Color(0xFF00afcc);
      }
      return Colors.black;
    }

    Future<Color> _holidayColor(int page, int grid) async {
      int sat = ((grid + 1) + calendar.startingWeekdayNumber()) % 7;
      int sun = (grid + calendar.startingWeekdayNumber()) % 7;
      final sample10 = calendar.dayPosition(page, grid);
      final holiday = await calendar.isHoliday(sample10);
      bool thisMonth = calendar.isThisMonth(page, grid);
      if (thisMonth && sun == 0 || thisMonth && holiday) {
        return Colors.red;
      } else if (thisMonth && sat == 0) {
        return Colors.blue;
      } else if (thisMonth) {
        return theme.textTheme.bodyText1!.color!;
      }
      return Colors.grey;
    }

    List<String> _weekdays() {
      List<String> weekday = ['日', '月', '火', '水', '木', '金', '土'];
      for (var i = 0; i < calendar.startingWeekdayNumber(); i++) {
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
            padding: EdgeInsets.zero,
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
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
      final result12 = calendar.isToday(page, grid);
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
              borderRadius: br4,
            ),
          ),
        );
      } else {
        return Container();
      }
    }

    Color _thisMonth1(int page, int grid) {
      final result13 = calendar.isThisMonth(page, grid);
      if (result13) {
        return Colors.transparent;
      } else {
        return Colors.black12;
      }
    }

    void _showEventList(DateTime date) {
      debugPrint('$dateを受け取りました');
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              border: Border.all(color: Colors.black26),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  '${date.year}年${date.month}月${date.day}日',
                  style: const TextStyle(
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
        itemCount: itemCount,
        // controller: controller,
        onPageChanged: (value) => onPageChanged.value++,
        itemBuilder: (BuildContext context, int pageIndex) {
          final DateTime monthPosition = calendar.monthPosition(pageIndex);
          final int gridCount = calendar.gridCount(monthPosition);
          final List<DateTime> dateList = calendar.dateList(monthPosition);
          final List<int> days = calendar.days(dateList);

          Color color(int index) {
            if (index % 7 == 0) {
              return Colors.red;
            } else if (index % 7 == 6) {
              return Colors.blue;
            }

            return theme.textTheme.bodyText1!.color!;
          }

          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return GridView.count(
                crossAxisCount: 7,
                children: List.generate(gridCount, (gridIndex) {
                  final String data = days[gridIndex].toString();

                  return GestureDetector(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          _today(pageIndex, gridIndex),
                          Center(
                            child: Text(
                              data,
                              style: TextStyle(
                                color: color(gridIndex),
                              ),
                            ),
                            /*
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
                            */
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      final sample10 = calendar.dayPosition(pageIndex, gridIndex);
                      debugPrint('$sample10');
                      calendar.isHoliday(sample10).then((value) {
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
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    showModalBottomSheet<void>(
      context: context,
      constraints: const BoxConstraints.expand(height: 300),
      backgroundColor: theme.primaryColor,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '0000年00月00日 月曜日',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                '大安',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              ListView(
                padding: const EdgeInsets.only(top: 16),
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
                              const Text(
                                '12:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              const Text(
                                '13:00',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 12, top: 4, right: 0, bottom: 4),
                            decoration: const BoxDecoration(
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
                                const Text(
                                  '映画',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const Text(
                                  'TOHOシネマ なんば',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
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
                              const Text(
                                '終日',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 12, top: 4, right: 0, bottom: 4),
                            decoration: const BoxDecoration(
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
                                const Text(
                                  '映画',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const Text(
                                  'TOHOシネマ なんば',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
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

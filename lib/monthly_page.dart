import 'package:flutter/material.dart';
import 'package:flutter_app/weekday_row.dart';

import 'calendar.dart';

class MonthlyPage extends StatefulWidget {
  MonthlyPage({Key? key}) : super(key: key);

  @override
  State<MonthlyPage> createState() => _MonthlyPageState();
}

class _MonthlyPageState extends State<MonthlyPage> {
  Calendar calendar = Calendar();

  Color weekdayColor(int index) {
    int sat = ((index + 1) + calendar.startingWeekdayNumber()) % 7;
    int sun = (index + calendar.startingWeekdayNumber()) % 7;
    if (sun == 0) {
      return Color(0xFFe8383d);
    } else if (sat == 0) {
      return Color(0xFF00afcc);
    }
    return Colors.black;
  }

  Future<Color> holidayColor(int page, int grid) async {
    int sat = ((grid + 1) + calendar.startingWeekdayNumber()) % 7;
    int sun = (grid + calendar.startingWeekdayNumber()) % 7;
    final sample10 = calendar.sample10(page, grid);
    final holiday = await calendar.isHoliday(sample10);
    bool thisMonth = calendar.isThisMonth(page, grid);
    if (thisMonth && sun == 0 || thisMonth && holiday) {
      return Color(0xFFe8383d);
    } else if (thisMonth && sat == 0) {
      return Color(0xFF00afcc);
    } else if (thisMonth) {
      return Colors.black;
    }
    return Colors.grey;
  }

  List<String> weekdays() {
    List<String> weekday = ['日', '月', '火', '水', '木', '金', '土'];
    for (var i = 0; i < calendar.startingWeekdayNumber(); i++) {
      String value = weekday[0];
      weekday.removeAt(0);
      weekday.add(value);
    }
    return weekday;
  }

  void showSettingBottomSheet() {
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
            children: [
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
                  children: [
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
                children: [
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
                    children: listTile,
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

  List<Widget> listTile = <Widget>[
    ListTile(
      leading: const Icon(Icons.calendar_today),
      title: const Text('カレンダー'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        debugPrint('カレンダー');
      },
    ),
  ];

  Widget today(int page, int grid) {
    final result12 = calendar.sample12(page, grid);
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

  Color thisMonth1(int page, int grid) {
    final result13 = calendar.isThisMonth(page, grid);
    if (result13) {
      return Colors.transparent;
    } else {
      return Colors.black12;
    }
  }

  void showEventList(DateTime date) {
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
            children: [
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

  @override
  Widget build(BuildContext context) {
    int initialPage = calendar.sample11();
    PageController controller = PageController(initialPage: initialPage);

    return Column(
      children: [
        const WeekdayRow(),
        Expanded(
          child: PageView.builder(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int pageIndex) {
              final sample9 = calendar.sample9(pageIndex);
              final sample5 = calendar.gridCount(sample9);
              //final sample6 = calendar.sample6(sample5);
              final sample7 = calendar.dateList(sample9);
              final sample8 = calendar.days(sample7);
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
                            children: [
                              today(pageIndex, gridIndex),
                              Center(
                                child: FutureBuilder(
                                  future: holidayColor(pageIndex, gridIndex),
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
                          final sample10 = calendar.sample10(pageIndex, gridIndex);
                          debugPrint('$sample10');
                          calendar.isHoliday(sample10).then((value) {
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
            itemCount: calendar.monthCount(),
          ),
        ),
      ],
    );
  }
}

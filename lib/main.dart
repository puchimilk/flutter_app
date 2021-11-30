import 'package:flutter/material.dart';

import 'calendar.dart';
import 'modal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Source Han Sans JP Regular',
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Calendar calendar = Calendar();

  Color weekdayColor(int index) {
    int sat = ((index + 1) + calendar.startingWeekdayNumber()) % 7;
    int sun = (index + calendar.startingWeekdayNumber()) % 7;
    if (sun == 0) {
      return Colors.red;
    } else if (sat == 0) {
      return Colors.blue;
    }
    return Colors.black;
  }

  Color holidayColor(int page, int grid) {
    int sat = ((grid + 1) + calendar.startingWeekdayNumber()) % 7;
    int sun = (grid + calendar.startingWeekdayNumber()) % 7;
    final sample10 = calendar.sample10(page, grid);
    bool holiday = calendar.isHoliday(sample10);
    if (sun == 0 || holiday) {
      return Colors.red;
    } else if (sat == 0) {
      return Colors.blue;
    }
    return Colors.black;
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
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Color thisMonth1(int page, int grid) {
    final result13 = calendar.sample13(page, grid);
    if (result13) {
      return Colors.transparent;
    } else {
      return Colors.black12;
    }
  }

  Color thisMonth2(int page, int grid) {
    final result13 = calendar.sample13(page, grid);
    if (result13) {
      return Colors.transparent;
    } else {
      return Colors.black12;
    }
  }

  @override
  Widget build(BuildContext context) {
    int initialPage = calendar.sample11();
    PageController controller = PageController(initialPage: initialPage);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => showModalBottomSheet(
            context: context,
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.945),
            isScrollControlled: true,
            enableDrag: false,
            builder: (context) => Navigator(
              onGenerateRoute: (context) => MaterialPageRoute<ModalPage>(
                builder: (context) => ModalPage(),
              ),
            ),
          ),
          padding: const EdgeInsets.all(12),
          icon: const Icon(
            Icons.settings,
            size: 24,
          ),
        ),
        title: const Center(
          child: Text(
            'カレンダー',
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => controller.jumpToPage(initialPage),
            padding: const EdgeInsets.all(12),
            icon: const Icon(
              Icons.today,
              size: 24,
            ),
          ),
        ],
        elevation: 0,
        toolbarHeight: 48,
        leadingWidth: 48,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                Size size = Size(constraints.maxWidth / 7, constraints.maxHeight);
                return Wrap(
                  children: List.generate(7, (index) {
                    return Container(
                      width: size.width,
                      height: size.height,
                      alignment: Alignment.center,
                      child: Text(
                        weekdays()[index],
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.2,
                          color: weekdayColor(index),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
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
                            color: thisMonth1(pageIndex, gridIndex),
                            child: Stack(
                              children: [
                                today(pageIndex, gridIndex),
                                Center(
                                  child: Text(
                                    sample8[gridIndex].toString(),
                                    style: TextStyle(
                                      color: holidayColor(pageIndex, gridIndex),
                                      fontSize: 12,
                                      height: 1.1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            final sample10 = calendar.sample10(pageIndex, gridIndex);
                            debugPrint('$sample10');
                            final holiday = calendar.isHoliday(sample10) ? '祝日です' : '祝日ではありません';
                            debugPrint(holiday);
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
      ),
    );
  }
}

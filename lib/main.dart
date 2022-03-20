import '/importer.dart';

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
        primaryColor: AppColors.primary,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: AppColors.darkGrey),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TODO: Todayページ実装
  // TODO:  祝日判定の処理の重さ問題

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = <Widget>[
      Column(
        children: const <Widget>[
          const WeekdayRow(),
          //const MonthCalendarView(),
          const TestMonthCalendarView(),
        ],
      ),
      const WeekCalendarView(),
      const DayCalendarView(),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _showModalPage(context),
        ),
        title: const Text('タイトル'),
        actions: [
          SizedBox(
            width: 56,
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // fetchEvent();
              },
            ),
          ),
          SizedBox(
            width: 56,
            child: IconButton(
              icon: const Icon(Icons.today),
              // onPressed: () => ref.watch(pageControllerProvider),
              onPressed: () {},
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(),
      // body: _children[ref.watch(bottomNavigationProvider)],
      /*
      body: Column(
        children: [
          const WeekdayRow(),
          MonthCalendarView(),
        ],
      ),
      */
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddEventPage(context),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  BoxConstraints _constraints(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final double height = data.size.height - data.padding.top;
    return BoxConstraints(maxHeight: height);
  }

  void _showModalPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: _constraints(context),
      builder: (context) => const ModalPage(),
    );
  }

  void _showAddEventPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: _constraints(context),
      builder: (context) => const EventAddPage(),
    );
  }

  // void fetchEvent() async {
  //   final x = await FirebaseFirestore.instance.collection('users').doc('12345').get();
  //   print(x.data());
  // }
}

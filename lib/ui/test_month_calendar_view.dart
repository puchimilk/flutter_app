import '/importer.dart';

class TestMonthCalendarView extends StatefulWidget {
  const TestMonthCalendarView({Key? key}) : super(key: key);

  @override
  State<TestMonthCalendarView> createState() => _TestMonthCalendarViewState();
}

class _TestMonthCalendarViewState extends State<TestMonthCalendarView> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Calendar calendar = Calendar();
    final int itemCount = Calendar().monthCount();
    final ScrollController _controller = ScrollController();

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
    
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size size = Size(constraints.maxWidth, constraints.maxHeight);

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            physics: const PageScrollPhysics(),
            itemCount: itemCount,
            cacheExtent: size.width * 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int pageIndex) {
              final DateTime monthPosition = calendar.monthPosition(pageIndex);
              final int gridCount = calendar.gridCount(monthPosition);
              final List<DateTime> dateList = calendar.dateList(monthPosition);
              final List<int> days = calendar.days(dateList);
              
              return SizedBox(
                width: size.width,
                height: size.height,
                child: GridView.count(
                  crossAxisCount: 7,
                  children: List.generate(gridCount, (gridIndex) {
                    return InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        child: FutureBuilder(
                          future: _holidayColor(pageIndex, gridIndex),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            return Text(
                              days[gridIndex].toString(),
                              style: TextStyle(
                                color: snapshot.data,
                                height: 1.2,
                              ),
                            );
                          },
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

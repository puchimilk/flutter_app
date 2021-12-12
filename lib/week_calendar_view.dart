import 'package:flutter/material.dart';

class WeekCalendarView extends StatefulWidget {
  const WeekCalendarView({Key? key}) : super(key: key);

  @override
  State<WeekCalendarView> createState() => _WeekCalendarViewState();
}

class _WeekCalendarViewState extends State<WeekCalendarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 72),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          Size size = Size(constraints.maxWidth / 7, constraints.maxHeight);
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: size.width,
                height: size.height,
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dec',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text('$index'),
                        Text(
                          'Sun',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.black,
            ),
            itemCount: 12,
          );
        },
      ),
    );
  }
}

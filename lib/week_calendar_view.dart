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
      constraints: BoxConstraints.expand(height: 80),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          Size size = Size(constraints.maxWidth / 7, constraints.maxHeight);
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: size.width,
                height: size.height,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Sun',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '$index',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

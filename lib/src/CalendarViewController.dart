import 'package:flutter/material.dart';
import 'utils.dart';

class MonthView extends StatefulWidget {
  MonthView({
    this.firstDate,
    this.lastDate,
    this.focusDate,
  });
  
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? focusDate;
  
  _MonthView createState() => _MonthView();
}

class _MonthView extends State<MonthView> {
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int i) {
          final pageIndex = DateTime(widget.firstDate!.year, widget.firstDate!.month + i);
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              Size size = Size(constrains.maxWidth, constrains.maxHeight);
              final dayLength = day(pageIndex).length;
              final weekNumber = day(pageIndex).length / 7;
              return Wrap(
                children: List.generate(dayLength, (index) {
                  return SizedBox(
                    width: size.width / 7,
                    height: size.height / weekNumber,
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: month(pageIndex)[index] == true ? Colors.black12 : Colors.white,
                          border: Border.all(
                            color: Colors.black26,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          day(pageIndex)[index].toString(),
                          style: TextStyle(
                            color: dayOfWeekColor(index),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                }),
              );
            },
          );
        },
        itemCount: monthCount(widget.firstDate!, widget.lastDate!),
      ),
    );
  }
}

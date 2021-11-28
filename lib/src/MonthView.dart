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
    final controller = PageController();
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int pageIndex) {
          final pageDate = DateTime(widget.firstDate!.year, widget.firstDate!.month + pageIndex);
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              Size size = Size(constrains.maxWidth, constrains.maxHeight);
              final monthGridCount = day(pageDate).length;
              final weeksNumber = day(pageDate).length / 7;
              return Wrap(
                children: List.generate(monthGridCount, (listIndex) {
                  return SizedBox(
                    width: size.width / 7,
                    height: size.height / weeksNumber,
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: month(pageDate)[listIndex] == true
                              ? Colors.black12
                              : Colors.white,
                          border: Border.all(
                            color: Colors.black26,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          day(pageDate)[listIndex].toString(),
                          style: TextStyle(
                            color: weekdayColor(listIndex),
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
        itemCount: monthNumber(widget.firstDate!, widget.lastDate!),
      ),
    );
  }
}

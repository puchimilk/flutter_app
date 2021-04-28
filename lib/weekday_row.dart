import 'package:flutter/material.dart';

class WeekdayRow extends StatelessWidget {
  final weekday = ['SAN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: List.generate(7, (i) {
          TextStyle weekcolor;
          switch (i) {
            case 0:
              weekcolor = TextStyle(
                color: Colors.red,
                fontSize: 12,
              );
              break;
            case 6:
              weekcolor = TextStyle(
                color: Colors.blueAccent,
                fontSize: 12,
              );
              break;
            default:
              weekcolor = TextStyle(
                color: Colors.black,
                fontSize: 12,
              );
              break;
          }
          return Expanded(
            child: Container(
              height: 24,
              child: Center(
                child: Text(
                  weekday[i],
                  style: weekcolor,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

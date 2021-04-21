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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              );
              break;
            case 6:
              weekcolor = TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              );
              break;
            default:
              weekcolor = TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              );
              break;
          }
          return Expanded(
            child: Container(
              height: 32,
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

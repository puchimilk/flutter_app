import 'package:flutter/material.dart';
import 'package:flutter_app/calendar.dart';

class TestPage1 extends StatefulWidget {
  TestPage1({Key? key}) : super(key: key);

  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  List<String> weekdays = ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'];
  StartingWeekday startingWeekday = StartingWeekday.sunday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Center(
          child: Text('曜日'),
        ),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text('設定1'),
            ),
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: List.generate(weekdays.length, (index) {
                return RadioListTile(
                  title: Text(weekdays[index]),
                  value: StartingWeekday.values[index],
                  groupValue: startingWeekday,
                  onChanged: (StartingWeekday? value) {
                    setState(() {
                      startingWeekday = value!;
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/calendar.dart';

class SettingPage1 extends StatefulWidget {
  const SettingPage1({Key? key}) : super(key: key);

  State<SettingPage1> createState() => _SettingPage1State();
}

class _SettingPage1State extends State<SettingPage1> {
  List<String> weekdays = ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'];
  StartingWeekday startingWeekday = StartingWeekday.sunday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
        title: const Text('タイトル'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'テキスト１',
                style: TextStyle(height: 1.2),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: List.generate(weekdays.length, (index) {
                return RadioListTile(
                  title: Text(
                    weekdays[index],
                    style: TextStyle(height: 1.2),
                  ),
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

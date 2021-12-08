import 'package:flutter/material.dart';
import 'package:flutter_app/calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'setting_page1.dart';

class ModalPage extends StatefulWidget {
  ModalPage({Key? key}) : super(key: key);

  State<ModalPage> createState() => _ModalPageState();
}

_saveBool(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

class _ModalPageState extends State<ModalPage> {
  StartingWeekday startingWeekday = StartingWeekday.sunday;
  bool _giveVerse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(startingWeekday),
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          padding: EdgeInsets.all(12),
        ),
        centerTitle: true,
        title: Text(
          '設定',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        elevation: 1,
        toolbarHeight: 48,
        leadingWidth: 48,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.945,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                '設定',
                style: TextStyle(fontSize: 14),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                ListTile(
                  leading: Icon(Icons.today),
                  title: Text(
                    '設定1',
                    style: TextStyle(
                      height: 1.2,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage1())).then((value) => {startingWeekday = value, print(startingWeekday)}),
                ),
                ListTile(
                  leading: Icon(Icons.today),
                  title: Text(
                    '設定2',
                    style: TextStyle(
                      height: 1.2,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.today),
                  title: Text(
                    '設定3',
                    style: TextStyle(
                      height: 1.2,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.today),
                  title: Text(
                    '六曜',
                    style: TextStyle(
                      height: 1.2,
                    ),
                  ),
                  trailing: Switch(
                    value: _giveVerse,
                    onChanged: (bool newValue) {
                      setState(() {
                        _giveVerse = newValue;
                        _saveBool('rokuyou', _giveVerse);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

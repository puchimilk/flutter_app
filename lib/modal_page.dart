import 'package:flutter/material.dart';

import 'setting_page1.dart';

class ModalPage extends StatelessWidget {
  const ModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タイトル'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'テキスト１',
                style: TextStyle(height: 1.2),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.today),
                  title: Text(
                    'テキスト１',
                    style: TextStyle(height: 1.2),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => SettingPage1(),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.today),
                  title: Text(
                    'テキスト２',
                    style: TextStyle(height: 1.2),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'テキスト２',
                style: TextStyle(height: 1.2),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.today),
                  title: Text(
                    'テキスト３',
                    style: TextStyle(height: 1.2),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.today),
                  title: Text(
                    'テキスト４',
                    style: TextStyle(height: 1.2),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

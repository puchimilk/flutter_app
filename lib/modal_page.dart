import 'package:flutter/material.dart';

import 'setting_page1.dart';

class ModalPage extends StatelessWidget {
  const ModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.today),
                  title: const Text(
                    'テキスト１',
                    style: TextStyle(height: 1.2),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingPage1(),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.today),
                  title: const Text(
                    'テキスト２',
                    style: TextStyle(height: 1.2),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'テキスト２',
                style: TextStyle(height: 1.2),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.today),
                  title: const Text(
                    'テキスト３',
                    style: TextStyle(height: 1.2),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.today),
                  title: const Text(
                    'テキスト４',
                    style: TextStyle(height: 1.2),
                  ),
                  trailing: const Icon(Icons.chevron_right),
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

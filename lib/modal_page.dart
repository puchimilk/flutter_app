import 'package:flutter/material.dart';

import 'setting_page1.dart';

class ModalPage extends StatefulWidget {
  ModalPage();

  State<ModalPage> createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          icon: Icon(Icons.close),
        ),
        title: Center(
          child: Text('タイトル'),
        ),
        elevation: 0,
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TestPage1())),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

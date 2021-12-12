import 'package:flutter/material.dart';

class AddEventPage extends StatelessWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
        title: const Text('タイトル'),
        actions: <Widget>[
          SizedBox(
            width: 56,
            child: IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'タイトル',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '場所',
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('終日'),
                      trailing: Switch(
                        value: false,
                        onChanged: (bool value) {},
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.ac_unit),
                      title: Text(
                        '2021/12/13',
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '12:00 AM',
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.ac_unit),
                      title: Text(
                        '2021/12/13',
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '13:00 AM',
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        ListTile(
                          title: const Text('繰り返し'),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('カレンダー'),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('通知'),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'メモ',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          icon: Icon(Icons.close),
        ),
        title: Text('タイトル'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'タイトル',
                      ),
                    ),
                    const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '場所',
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          title: Text('終日'),
                          trailing: Switch(
                            value: false,
                            onChanged: (bool value) {},
                          ),
                        ),
                        ListTile(
                          title: Text('繰り返し'),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('カレンダー'),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('通知'),
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

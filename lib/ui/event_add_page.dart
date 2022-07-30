import 'package:flutter_app/importer.dart';

class EventAddPage extends StatelessWidget {
  const EventAddPage({super.key});

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
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                // addEvent();
              },
            ),
          ),
        ],
        elevation: 0,
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
                    const ListTile(
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
                    const ListTile(
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
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('カレンダー'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('通知'),
                          trailing: const Icon(Icons.chevron_right),
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

  // void addEvent() async {
  //   await FirebaseFirestore.instance.collection('users').doc('12345').set({
  //     'id': 'ca8f7f',
  //     'created': DateTime(2021, 12, 15),
  //     'updated': DateTime(2021, 12, 21),
  //     'summary': '映画', // タイトル
  //     'description': '騙し絵の牙', // メモ
  //     'location': 'TOHOシネマ なんば', // 場所
  //     'start': {
  //       'date': DateTime(2021, 12, 17, 13, 30),
  //     }, // 開始日時
  //     'end': {
  //       'date': DateTime(2021, 12, 17, 15, 30),
  //     }, // 終了日時
  //     'endTimeUnspecified': false, // 終了時刻が指定してされているか
  //   });
  // }
}

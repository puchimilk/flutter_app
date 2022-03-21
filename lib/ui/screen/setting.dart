import '/importer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        children: [
          Text('ヘッダー１'),
          ListTile(
            title: Text('設定１'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('設定２'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Text('ヘッダー２'),
          ListTile(
            title: Text('設定３'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('設定４'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

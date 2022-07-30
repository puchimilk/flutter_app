import 'package:flutter_app/importer.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 12, right: 16),
          child: Text('Header1'),
        ),
        ListTile(
          title: const Text('設定１'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('設定２'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 12, right: 16),
          child: Text('Header2'),
        ),
        ListTile(
          title: const Text('設定３'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('設定４'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('ヘルプ'),
          onTap: () {},
        ),
      ],
    );
  }
}

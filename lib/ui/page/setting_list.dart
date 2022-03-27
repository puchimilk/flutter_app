import 'package:flutter_app/importer.dart';

class SettingList extends StatelessWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      children: [
        const Text('ヘッダー１'),
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
        const Text('ヘッダー２'),
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
      ],
    );
  }
}

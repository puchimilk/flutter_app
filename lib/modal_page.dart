import 'package:flutter/material.dart';
import 'package:flutter_app/add_event_page.dart';

class ModalPage extends StatelessWidget {
  const ModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイトル'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '基本設定',
              style: TextStyle(
                height: 1.2,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: const Text(
                  'テキスト１',
                  style: TextStyle(height: 1.2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator(
                  onGenerateRoute: (context) => MaterialPageRoute<Scaffold>(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: const Text('タイトル'),
                      ),
                      body: Column(
                        children: [
                          const Text('テキスト１'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
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
            padding: EdgeInsets.all(10),
            child: Text(
              '詳細設定',
              style: TextStyle(
                height: 1.2,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: const Text(
                  'テキスト３',
                  style: TextStyle(height: 1.2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  'テキスト４',
                  style: TextStyle(height: 1.2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'サポート',
              style: TextStyle(
                height: 1.2,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: const Text(
                  'テキスト５',
                  style: TextStyle(height: 1.2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  'テキスト６',
                  style: TextStyle(height: 1.2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddEventPage(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final double height = data.size.height - data.padding.top;
    final BoxConstraints constraints = BoxConstraints(maxHeight: height);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: constraints,
      builder: (context) => const AddEventPage(),
    );
  }
}

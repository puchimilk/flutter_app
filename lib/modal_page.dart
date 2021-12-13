import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/modal_page_list_tile.dart';

class ModalPage extends StatelessWidget {
  const ModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイトル'),
        elevation: 0,
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
              const ModalPageListTile(
                title: 'テキスト１',
              ),
              const ModalPageListTile(
                title: 'テキスト２',
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
              const ModalPageListTile(
                title: 'テキスト３',
              ),
              const ModalPageListTile(
                title: 'テキスト４',
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
              const ModalPageListTile(
                title: 'テキスト５',
              ),
              const ModalPageListTile(
                title: 'テキスト６',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

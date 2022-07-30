import 'package:flutter_app/importer.dart';

class MemoScreen extends StatelessWidget {
  const MemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo'),
      ),
      body: const Center(child: Text('Memo Screen')),
    );
  }
}

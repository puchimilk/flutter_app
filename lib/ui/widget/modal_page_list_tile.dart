import 'package:flutter_app/importer.dart';

class ModalPageListTile extends StatelessWidget {
  const ModalPageListTile({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        constraints: const BoxConstraints.expand(height: 56),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.ac_unit),
            Text(
              'てきすと',
              style: TextStyle(),
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

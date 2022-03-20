import '/importer.dart';

class ModalPageListTile extends StatelessWidget {
  const ModalPageListTile({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        constraints: BoxConstraints.expand(height: 56),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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

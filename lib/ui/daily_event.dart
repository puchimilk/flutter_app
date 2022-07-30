import 'package:flutter_app/importer.dart';

class DailyEvent extends StatefulWidget {
  const DailyEvent({
    super.key,
    required this.title,
    this.backgroundColor = Colors.red,
  });

  final String title;
  final Color backgroundColor;

  @override
  State<DailyEvent> createState() => _DailyEventState();
}

class _DailyEventState extends State<DailyEvent> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        padding: const EdgeInsets.all(4),
        color: widget.backgroundColor,
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

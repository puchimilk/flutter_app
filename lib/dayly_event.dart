import 'package:flutter/material.dart';

class DaylyEvent extends StatefulWidget {
  const DaylyEvent({
    Key? key,
    required this.title,
    this.backgroudColor = Colors.red,
  }) : super(key: key);

  final String title;
  final Color backgroudColor;

  @override
  State<DaylyEvent> createState() => _DaylyEventState();
}

class _DaylyEventState extends State<DaylyEvent> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        padding: const EdgeInsets.all(4),
        color: widget.backgroudColor,
        child: Text(
          widget.title,
          style: TextStyle(
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class DatePickerDialog extends StatefulWidget {
  DatePickerDialog({
    Key? key,
    required this.initialDate,
    this.restorationId,
  }) : super(key: key);
  
  final DateTime initialDate;
  final String? restorationId;
  
  _DatePickerDialogState createState() => _DatePickerDialogState();
}

class _DatePickerDialogState extends State<DatePickerDialog> with RestorationMixin {
  late final RestorableDateTime _selectedDate = RestorableDateTime(widget.initialDate);
  
  @override
  String? get restorationId => widget.restorationId;
  
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
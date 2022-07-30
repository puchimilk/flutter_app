import 'package:flutter_app/importer.dart';

class AddCalendarList extends StatefulWidget {
  const AddCalendarList({super.key});

  @override
  State<AddCalendarList> createState() => _AddCalendarListState();
}

class _AddCalendarListState extends State<AddCalendarList> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TextEditingController summaryController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    bool value = true;
    DateTime startDate = DateTime(now.year, now.month, now.day, now.hour);
    DateTime endDate = startDate.add(const Duration(hours: 1));

    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: summaryController,
                    decoration: const InputDecoration(
                      hintText: 'タイトル',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  pt8,
                  ListTile(
                    title: const Text('終日'),
                    trailing: Switch(
                      value: value,
                      onChanged: (newValue) {
                        setState(() {
                          value = newValue;
                        });
                      },
                    ),
                  ),
                  pt8,
                  ListTile(
                    title: const Text('開始日時'),
                    trailing: TextButton(
                      onPressed: () => _showDatePicker(context),
                      child: Text('$startDate'),
                    ),
                  ),
                  pt8,
                  ListTile(
                    title: const Text('終了日時'),
                    trailing: TextButton(
                      onPressed: () => _showDatePicker(context),
                      child: Text('$endDate'),
                    ),
                  ),
                  pt8,
                  const Text('詳細'),
                  pt8,
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  pt8,
                  const Text('場所'),
                  pt8,
                  TextField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 01, 01),
      lastDate: DateTime(2099, 12, 31),
    );

    if (date != null) {
      setState(() {
        now = date;
      });
    }
  }
}

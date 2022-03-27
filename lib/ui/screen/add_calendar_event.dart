import 'package:flutter_app/importer.dart';

class AddCalendarEventScreen extends StatefulWidget {
  const AddCalendarEventScreen({Key? key}) : super(key: key);

  @override
  State<AddCalendarEventScreen> createState() => _AddCalendarEventScreenState();
}

class _AddCalendarEventScreenState extends State<AddCalendarEventScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController summaryController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    bool _value = false;
    void _onChanged(bool newValue) => setState(() => _value = newValue);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Calendar Event'),
        actions: [
          IconButton(
            onPressed: () {
              final event = Event(
                summary: summaryController.text,
                description: descriptionController.text,
                created: DateTime.now(),
                location: locationController.text,
                colorId: 1,
                startDate: DateTime(2020),
                isAllDay: true,
              );
              _insertEvent(event);

              Routemaster.of(context).pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('タイトル'),
                    TextField(
                      controller: summaryController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Text('開始日時'),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Text('終了日時'),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Text('終日'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Start'),
                    ),
                    Switch(
                      value: _value,
                      onChanged: (bool newValue) => _onChanged(newValue),
                    ),
                    const Text('詳細'),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<void> _insertEvent(Event event) async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'event.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE event(id INTEGER PRIMARY KEY AUTOINCREMENT, summary TEXT, description TEXT, created TEXT, updated TEXT, location TEXT, colorId INTEGER, startDate TEXT, endDate TEXT, isAllDay INTEGER)',
        );
      },
    );

    final Database db = await database;
    await db.insert(
      'event',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<DateTime> _showDatePicker(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 01, 01),
      lastDate: DateTime(2099, 12, 31),
    ).then((result) => DateTime(result!.year, result.month, result.day));
  }
}

import '/importer.dart';

class AddCalendarEventScreen extends StatefulWidget {
  AddCalendarEventScreen({Key? key}) : super(key: key);

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
        title: Text('Create Calendar Event'),
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
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('タイトル'),
                    TextField(
                      controller: summaryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text('開始日時'),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text('終了日時'),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text('終日'),
                    TextButton(
                      onPressed: () async {
                        _showDatePicker(context);
                      },
                      child: Text('Start'),
                    ),
                    Switch(
                      value: _value,
                      onChanged: (bool newValue) => _onChanged(newValue),
                    ),
                    Text('詳細'),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
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

  Future<dynamic> _showDatePicker(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 01, 01),
      lastDate: DateTime(2099, 12, 31),
    ).then((result) => DateTime(result!.year, result.month, result.day));
  }
}

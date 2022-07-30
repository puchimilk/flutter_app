import 'package:flutter_app/importer.dart';
import 'package:sqflite/sqflite.dart';

class AddCalendarEventScreen extends StatefulWidget {
  const AddCalendarEventScreen({super.key});

  @override
  State<AddCalendarEventScreen> createState() => _AddCalendarEventScreenState();
}

class _AddCalendarEventScreenState extends State<AddCalendarEventScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController summaryController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController locationController = TextEditingController();

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
      body: const AddCalendarList(),
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
}

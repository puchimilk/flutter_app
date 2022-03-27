import 'package:flutter_app/importer.dart';

final _repositoryProvider = Provider((ref) => Repository());

final eventProvider = FutureProvider<List<Event>>((ref) async {
  final repository = ref.read(_repositoryProvider);
  return repository.fetchEvent();
});

class CalendarScreen extends StatelessWidget {
   const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            onPressed: () => Routemaster.of(context).push('/calendar/new'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Center(child: Text('Calendar Screen')),
    );
  }
}

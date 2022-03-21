import '/importer.dart';

final _repositoryProvider = Provider((ref) => Repository());

final todoProvider = StreamProvider.autoDispose<List<Todo>>((ref) {
  final repository = ref.read(_repositoryProvider);
  return repository.fetchTodo();
});

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        actions: [
          IconButton(
            onPressed: () => Routemaster.of(context).push('/todo/new'),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: TodoList(),
    );
  }
}

import 'package:flutter_app/importer.dart';

final _repositoryProvider = Provider((ref) => Repository());

final todoProvider = StreamProvider.autoDispose<List<Todo>>((ref) {
  final repository = ref.read(_repositoryProvider);
  return repository.fetchTodo();
});

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          IconButton(
            onPressed: () => Routemaster.of(context).push('/todo/new'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const TodoList(),
    );
  }
}

import 'package:flutter_app/importer.dart';

// final bottomNavigationProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.layers,
            color: Colors.red,
          ),
          label: 'month',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.layers,
            color: Colors.blue,
          ),
          label: 'week',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.layers,
            color: Colors.green,
          ),
          label: 'day',
        ),
      ],
      selectedItemColor: Colors.grey,
      // currentIndex: ref.watch(bottomNavigationProvider),
      onTap: (int index) {
        // ref.read(bottomNavigationProvider.notifier).state = index;
      },
    );
  }
}

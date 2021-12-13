import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
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
      currentIndex: ref.watch(bottomNavigationProvider),
      onTap: (int index) {
        print('onTap');
        ref.read(bottomNavigationProvider.notifier).state = index;
      },
    );
  }
}

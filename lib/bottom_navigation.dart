import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  void _onTap(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'red',
          icon: const Icon(
            Icons.layers,
            color: Colors.red,
          ),
        ),
        BottomNavigationBarItem(
          label: 'green',
          icon: const Icon(
            Icons.layers,
            color: Colors.green,
          ),
        ),
        BottomNavigationBarItem(
          label: 'blue',
          icon: const Icon(
            Icons.layers,
            color: Colors.blue,
          ),
        ),
      ],
      selectedItemColor: Colors.grey,
      elevation: 1,
      currentIndex: _currentIndex,
      onTap: _onTap,
    );
  }
}

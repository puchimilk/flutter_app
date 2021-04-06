import 'package:flutter/material.dart';

final PageController _defaultPageController = PageController();

class InfinitePage extends StatefulWidget {
  InfinitePage({
    Key key,
    PageController controller,
  })  : controller = controller ?? _defaultPageController,
        super(key: key);

  final PageController controller;

  @override
  _InfinitePageState createState() => _InfinitePageState();
}

class _InfinitePageState extends State<InfinitePage> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container();
  }
}

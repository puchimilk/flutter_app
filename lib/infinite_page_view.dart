import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final PageController _defaultPageController = PageController();

class InfinitePage extends StatefulWidget {
  InfinitePage({
    Key key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    PageController controller,
    this.itemBuilder,
    int itemCount,
  })  : controller = controller ?? _defaultPageController,
        childrenDelegate =
            SliverChildBuilderDelegate(itemBuilder, childCount: itemCount),
        super(key: key);

  final Axis scrollDirection;
  final bool reverse;
  final PageController controller;
  final IndexedWidgetBuilder itemBuilder;
  final SliverChildBuilderDelegate childrenDelegate;

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

  AxisDirection _getDirection(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);
    final AxisDirection axisDirection =
        textDirectionToAxisDirection(textDirection);
    return widget.reverse ? flipAxisDirection(axisDirection) : axisDirection;
  }

  Widget build(BuildContext context) {
    final AxisDirection axisDirection = _getDirection(context);

    return Scrollable(
      axisDirection: axisDirection,
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        return Viewport(
          offset: position,
          slivers: <Widget>[
            SliverFillViewport(
              delegate: widget.childrenDelegate,
            ),
          ],
        );
      },
    );
  }
}

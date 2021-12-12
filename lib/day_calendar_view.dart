import 'package:flutter/material.dart';

class DayCalendarView extends StatefulWidget {
  DayCalendarView({Key? key}) : super(key: key);

  @override
  State<DayCalendarView> createState() => _DayCalendarViewState();
}

class _DayCalendarViewState extends State<DayCalendarView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black26),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 4, bottom: 2, right: 4),
                child: Container(
                  constraints: const BoxConstraints.expand(height: 22),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Event 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 2, bottom: 4, right: 0),
                child: Container(
                  constraints: const BoxConstraints.expand(height: 22),
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Event 4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: <Widget>[
                  Column(
                    children: List.generate(24, (index) {
                      return Container(
                        width: 28,
                        height: 88,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.black12,
                            ),
                            bottom: BorderSide(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                        child: Text(
                          '$index',
                          style: const TextStyle(height: 1.2),
                        ),
                      );
                    }),
                  ),
                  Stack(
                    children: <Widget>[
                      Column(
                        children: List.generate(24, (index) {
                          return Container(
                            width: constraints.maxWidth - 28,
                            height: 88,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      Positioned(
                        top: 88 * 12,
                        child: Container(
                          color: Colors.red,
                          width: constraints.maxWidth - 28,
                          height: 88 * 0.5,
                          padding: const EdgeInsets.all(4),
                          child: const Text(
                            'Event 1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 88 * 13,
                        child: Container(
                          color: Colors.orange,
                          width: constraints.maxWidth - 28,
                          height: 88 * 0.25,
                          padding: const EdgeInsets.all(4),
                          child: const Text(
                            'Event 2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
    /*
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: 48,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: List.generate(24, (index) {
                        return Container(
                          width: width,
                          height: height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Text('$index'),
                        );
                      }),
                    ),
                    SizedBox(
                      width: constraints.maxWidth - width,
                      height: height * 24,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: List.generate(24, (index) {
                              return Container(
                                width: constraints.maxWidth - width,
                                height: height,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black12)),
                                ),
                              );
                            }),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                              width: constraints.maxWidth - width,
                              height: height * 24,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: height * 0,
                                    child: Container(
                                      color: Colors.red,
                                      width: constraints.maxWidth - width,
                                      height: 22,
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Event1',
                                            style: TextStyle(
                                              color: Colors.white,
                                              height: 1.2,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: height * 1,
                                    child: Container(
                                      color: Colors.amber,
                                      width: constraints.maxWidth - width,
                                      height: 22,
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Event 2',
                                            style: TextStyle(
                                              color: Colors.white,
                                              height: 1.2,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: height * 15,
                                    child: Container(
                                      color: Colors.blue,
                                      width: constraints.maxWidth - width,
                                      height: min45,
                                      padding: EdgeInsets.all(4),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Event 3',
                                            style: TextStyle(
                                              color: Colors.white,
                                              height: 1.2,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
    */
  }
}

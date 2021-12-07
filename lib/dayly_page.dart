import 'package:flutter/material.dart';

class DaylyPage extends StatefulWidget {
  DaylyPage({Key? key}) : super(key: key);

  @override
  State<DaylyPage> createState() => _DaylyPageState();
}

class _DaylyPageState extends State<DaylyPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = 24;
        final double height = 88;
        final int min = 60;
        final double min15 = (height / min) * 15;
        final double min30 = (height / min) * 30;
        final double min45 = (height / min) * 45;
        final double min60 = (height / min) * 60;
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
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
                  children: [
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
                          children: [
                            Positioned(
                              top: height * 0,
                              child: Container(
                                color: Colors.red,
                                width: constraints.maxWidth - width,
                                height: 22,
                                padding: EdgeInsets.all(4),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
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
                                  children: [
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
                                  children: [
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
        );
      },
    );
  }
}

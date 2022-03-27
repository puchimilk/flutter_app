import 'package:flutter_app/importer.dart';

// final controller = StateProvider.autoDispose((ref) => PageController(initialPage: 500));

class TestPage extends StatelessWidget {
  final int itemCount = DateUtils.monthDelta(DateTime(1970, 1), DateTime(2099, 12));
  //final PageController controller = PageController(initialPage: 500);
  final ValueNotifier<int> onPageChanged = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print('build is TestPage');
    Color color(int index) {
      if (index % 7 == 0) {
        return Colors.red;
      } else if (index % 7 == 6) {
        return Colors.blue;
      }
      return Theme.of(context).textTheme.bodyText1!.color!;
    }

    return PageView.builder(
      itemCount: itemCount,
      // controller: ref.watch(controller),
      onPageChanged: (value) => onPageChanged.value++,
      itemBuilder: (BuildContext context, int index) {
        return GridView.count(
          crossAxisCount: 7,
          children: List.generate(42, (index) {
            print('call is children');
            return Container(
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: TextStyle(
                  color: color(index),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

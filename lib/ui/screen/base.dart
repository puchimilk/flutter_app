import '/importer.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);

    return Scaffold(
      body: TabBarView(
        controller: tabPage.controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          for (final stack in tabPage.stacks)
            PageStackNavigator(stack: stack),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: tabPage.controller,
        tabs: [
          Tab(
            text: 'Calendar',
            icon: Icon(Icons.calendar_today),
          ),
          Tab(
            text: 'Todo',
            icon: Icon(Icons.check_box_outlined),
          ),
          Tab(
            text: 'Memo',
            icon: Icon(Icons.description_outlined),
          ),
          Tab(
            text: 'Search',
            icon: Icon(Icons.search),
          ),
          Tab(
            text: 'Setting',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

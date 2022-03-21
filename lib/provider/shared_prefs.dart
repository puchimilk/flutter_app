import '/importer.dart';

class SharedPrefs extends ChangeNotifier {
  SharedPrefs();

  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }
}

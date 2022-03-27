import 'package:flutter_app/importer.dart';

class SharedPrefs extends ChangeNotifier {
  bool _x = false;

  bool get x => _x;

  void setX() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("x", _x);

    notifyListeners();
  }
}

import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  String pwd = '';
  String userName = '';

  void updateUser(String u, String p) {
    userName = u;
    pwd = p;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}

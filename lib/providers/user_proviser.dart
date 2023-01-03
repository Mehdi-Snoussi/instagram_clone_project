import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  String pwd = '';
  String userName = '';

  /* Future<String?> getPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("loggedValue");
  }

  void setPref(String set) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('loggedValue', set);
  } */

  void updateUser(String u, String p) {
    userName = u;
    pwd = p;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}

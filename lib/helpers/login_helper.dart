import 'package:second_app/helpers/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user.dart';

class LoginHelper {
  DatabaseHelper con = DatabaseHelper();

  Future saveUser(User user) async {
    var dbClient = await con.db;
    dbClient.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

    Future<User?> getLogin(String user, String password) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM users WHERE userName = '$user' and pwd = '$password'");
    
    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }
  
  Future<int> getUsers() async {
    var dbClient = await con.db;
    var res = await dbClient.query('users');
    List<User> list =
        res.isNotEmpty ? res.map((e) => User.fromMap(e)).toList() : [];
    return list.length;
  }
}

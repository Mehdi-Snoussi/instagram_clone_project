class User {
  String? pwd;
  String? userName;

  User({
    this.pwd,
    this.userName,
  });

  User.fromMap(dynamic obj) {
    userName = obj['userName'];
    pwd = obj['pwd'];
  }

  String get _userName => userName!;
  String get _pwd => pwd!;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['userName'] = _userName;
    map['pwd'] = _pwd;
    return map;
  }
}

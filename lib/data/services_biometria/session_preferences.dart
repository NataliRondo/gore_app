import 'package:shared_preferences/shared_preferences.dart';

class SessionParams {
  static final String _userKey = '_userKey';
  static final String _passwordKey = '_passwordKey';
  final String user;
  final String password;

  SessionParams._(this.user, this.password);

  static Future<void> deleteSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
/*
  static Future<SessionParams> getSession() async {
    var prefs = await SharedPreferences.getInstance();
    var user = prefs.getString(_userKey) ?? '';
    var password = prefs.getString(_passwordKey) ?? '';
    return user, password);
    
  }
*/
  /// ❗ Throwable Function
  Future<void> saveSession(String user, String password) async {
    var prefs = await SharedPreferences.getInstance();
    var isSaveUserParam =
        await prefs.setString(_userKey, user);
    var isSavePasswordParam = await prefs.setString(_passwordKey, password);

    if (isSaveUserParam && isSavePasswordParam) return;

    deleteSession();
    throw '<SessionParams> session not saved';
  }

  @override
  String toString() {
    return 'SessionParams {user: $user, password $password}';
  }
}
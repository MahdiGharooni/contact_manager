import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  static SharedPreferences? _pref;
  static const String _prefIsLogin = 'is_login';

  static void setUserLoginStatus(bool _isLogin) async {
    _pref ??= await SharedPreferences.getInstance();
    _pref!.setBool(_prefIsLogin, _isLogin);
  }

  static Future<bool> getUserLoginStatus() async {
    _pref ??= await SharedPreferences.getInstance();
    if (_pref!.containsKey(_prefIsLogin)) {
      final bool _res = _pref!.getBool(_prefIsLogin) ?? false;
      return _res;
    } else {
      return false;
    }
  }
}

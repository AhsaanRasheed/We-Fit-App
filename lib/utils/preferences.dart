import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _fbToken = 'authTokenFB';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async {
    await _preferences!.setString(_fbToken, token);
  }

  static Object? getToken() => _preferences?.get(_fbToken);

  static String? getPref(String key) {
    var ob = _preferences!.get(key);
    if (ob == null) {
      return null;
    } else {
      return ob as String;
    }
  }

  static Future setPref(String key, String value) async {
    await _preferences?.setString(key, value);
  }
}

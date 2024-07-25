import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._(SharedPreferences sharedPreferences)
      : pref = sharedPreferences;

  static SharedPreferencesService? _instance;
  final SharedPreferences pref;

  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      final sharedPreferences = await SharedPreferences.getInstance();
      _instance = SharedPreferencesService._(sharedPreferences);
    }
    return _instance!;
  }

  String? getString(String key) {
    return pref.getString(key);
  }

  Future<void> setString(String key, String value) async {
    await pref.setString(key, value);
  }

  bool? getBool(String key) {
    return pref.getBool(key);
  }

  Future<void> setBool(String key, bool value) async {
    await pref.setBool(key, value);
  }
}

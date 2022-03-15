import 'package:shared_preferences/shared_preferences.dart';

class LanguageHelper {
  static const String _languageToken = "languageToken";
  static const String _flagToken = "flagToken";

  static Future<bool> isLanguageSet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageToken) != null;
  }

  static void saveCurrentLanguage(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_languageToken, value);
  }

  static Future<String> getCurrentLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageToken)!;
  }

  static void saveCurrentLanguageFlag(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_flagToken, value);
  }

  static Future<String> getCurrentLanguageFlag() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_flagToken)!;
  }
}

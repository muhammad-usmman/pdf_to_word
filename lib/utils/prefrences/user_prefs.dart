import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static late SharedPreferences prefs;

 static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

 static Future setTheme(bool value) async {
     await prefs.setBool('Theme', value);
  }

// 0 Light Theme
// 1 dark Theme
 static bool getTheme()    {
    return   prefs.getBool('Theme') ?? true;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
 static setTheme(String value) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    await shp.setString('theme', value);
  }
 static Future<String?> getTheme() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.getString('theme');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:kanji_phay_mal/utils/share_pref.dart';

class ThemeProvider extends foundation.ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  checkThemeMode() async {
    var check = await SharePref.getTheme();
    if (check != 'null' || check != null) {
      if (check == 'dark') {
        themeMode = ThemeMode.dark;
      } else if (check == 'light') {
        themeMode = ThemeMode.light;
      }
      notifyListeners();
    }
  }

  changeLightTheme() async {
    themeMode = ThemeMode.light;
    await SharePref.setTheme('light');
    notifyListeners();
  }

  changeDarkTheme() async {
    themeMode = ThemeMode.dark;
    await SharePref.setTheme('dark');
    notifyListeners();
  }
}

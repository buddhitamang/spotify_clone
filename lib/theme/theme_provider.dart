import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotifyclone/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  static const String _themePrefKey = 'theme_mode';

  ThemeData get themeData => _themeData;
  Future<void> get saveTheme=>_saveTheme();
  Future<void> get loadTheme=>_loadTheme();

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }


  Future<void> _saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themePrefKey, _themeData == darkMode);

  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool(_themePrefKey) ?? false;
    _themeData = isDarkMode ? darkMode : lightMode;
    notifyListeners();
  }


}

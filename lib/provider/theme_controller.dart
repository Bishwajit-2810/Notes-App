import 'package:flutter/material.dart';

import 'light.dart';

class ThemeController extends ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;
  void setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  bool isDarkTheme() {
    if (_themeData == darkTheme) {
      return true;
    } else {
      return false;
    }
  }

  void darkThemeSel() {
    setThemeData(darkTheme);
  }

  void lightThemeSel() {
    setThemeData(lightTheme);
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      setThemeData(darkTheme);
    } else {
      setThemeData(lightTheme);
    }
  }
}

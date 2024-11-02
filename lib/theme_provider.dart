import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get GetThemeData => _themeData;

  void ToggleMode() {
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    log("toggled theme");
    notifyListeners();
  }
}

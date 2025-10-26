import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeMode _themeMode = ThemeMode.system;

  get getThemeMode => _themeMode;

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  bool get isDarkMode => (_themeMode == ThemeMode.dark) ? true : false;



}
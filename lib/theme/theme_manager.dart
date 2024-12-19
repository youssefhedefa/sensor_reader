import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;

  makeTheThemeLight(){
    currentTheme = ThemeMode.light;
    notifyListeners();
  }

  makeTheThemeDark(){
    currentTheme = ThemeMode.dark;
    print(currentTheme);
    notifyListeners();
  }

}
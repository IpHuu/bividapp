import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = UIHelper.defaultTheme;
  ThemeNotifier(this._themeData);

  ThemeData get myTheme => _themeData;

  set myTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class DialogViewModel extends ChangeNotifier {
  String? _message;
  String? _title;

  String? get message => _message;
  String? get title => _title;

  void showDialog(String title, String message) {
    _title = title;
    _message = message;
    notifyListeners();
  }

  void closeDialog() {
    _title = null;
    _message = null;
    notifyListeners();
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class DialogManager {
  static final DialogManager _instance = DialogManager._internal();
  factory DialogManager() => _instance;
  DialogManager._internal();

  BuildContext? _context; // Lưu context của ứng dụng

  void setContext(BuildContext context) {
    _context = context;
  }

  void showDialog({
    required String title,
    required String message,
    DialogType type = DialogType.info,
    VoidCallback? onOkPressed,
  }) {
    if (_context == null) return;

    AwesomeDialog(
      context: _context!,
      dialogType: type,
      animType: AnimType.rightSlide,
      title: title,
      desc: message,
      btnOkOnPress: onOkPressed ?? () {},
    ).show();
  }
}

import 'package:flutter/material.dart';

enum Status {
  created,
  confirmed,
  edited,
  pending,
  rejected,
}

extension StatusOrder on Status {
  int get id {
    switch (this) {
      case Status.created:
        return 1;
      case Status.confirmed:
        return 2;
      case Status.rejected:
        return 3;
      case Status.edited:
        return 4;
      case Status.pending:
        return 5;
    }
  }

  String get name {
    switch (this) {
      case Status.created:
        return "Khởi tạo";
      case Status.confirmed:
        return "Xác nhận";
      case Status.rejected:
        return "Huỷ";
      case Status.edited:
        return "Sửa";
      case Status.pending:
        return "Chờ xử lý";
    }
  }

  Color get backgroundColor {
    switch (this) {
      case Status.created:
        return Colors.blue[100] ?? Colors.blue;
      case Status.confirmed:
        return Colors.green[100] ?? Colors.green;
      case Status.rejected:
        return Colors.red[100] ?? Colors.red;
      case Status.edited:
        return Colors.orange[100] ?? Colors.orange;
      case Status.pending:
        return Colors.amber[100] ?? Colors.amber;
    }
  }

  Color get textColor {
    switch (this) {
      case Status.created:
        return Colors.blue[800] ?? Colors.blue;
      case Status.confirmed:
        return Colors.green[800] ?? Colors.green;
      case Status.rejected:
        return Colors.red[800] ?? Colors.red;
      case Status.edited:
        return Colors.orange[800] ?? Colors.orange;
      case Status.pending:
        return Colors.amber[800] ?? Colors.amber;
    }
  }

  static Status getById(int id) {
    return Status.values
        .firstWhere((status) => status.id == id, orElse: () => Status.pending);
  }
}

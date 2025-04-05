enum TypePhanTich { ngay, tuan, thang, quy }

extension TypePhanTichExtension on TypePhanTich {
  int get value {
    switch (this) {
      case TypePhanTich.ngay:
        return 0;
      case TypePhanTich.tuan:
        return 1;
      case TypePhanTich.thang:
        return 2;
      case TypePhanTich.quy:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case TypePhanTich.ngay:
        return "Ngày";
      case TypePhanTich.tuan:
        return "Tuần";
      case TypePhanTich.thang:
        return "Tháng";
      case TypePhanTich.quy:
        return "Quý";
    }
  }

  static TypePhanTich fromValue(int value) {
    return TypePhanTich.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TypePhanTich.thang,
    );
  }
}

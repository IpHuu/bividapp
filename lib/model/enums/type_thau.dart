enum TypeThau {
  thang,
  chinhanh,
  nhomkhachhang,
  nhomsanpham,
  nhanvien,
  khachhang,
  sanpham,
  tonthau,
  tongquan
}

extension TypeThauExtension on TypeThau {
  int get value {
    switch (this) {
      case TypeThau.thang:
        return 0;
      case TypeThau.chinhanh:
        return 1;
      case TypeThau.nhomkhachhang:
        return 2;
      case TypeThau.nhomsanpham:
        return 3;
      case TypeThau.nhanvien:
        return 4;
      case TypeThau.khachhang:
        return 5;
      case TypeThau.sanpham:
        return 6;
      case TypeThau.tonthau:
        return 7;
      case TypeThau.tongquan:
        return 8;
    }
  }

  String get name {
    switch (this) {
      case TypeThau.chinhanh:
        return "Chi nhánh";
      case TypeThau.nhomkhachhang:
        return "Nhóm khách hàng";
      case TypeThau.nhomsanpham:
        return "Nhóm sản phẩm";
      case TypeThau.nhanvien:
        return "Nhân viên";
      case TypeThau.khachhang:
        return "Khách hàng";
      case TypeThau.sanpham:
        return "Sản phẩm";
      case TypeThau.tonthau:
        return "Tồn thầu";
      default:
        return "";
    }
  }

  static TypeThau fromValue(int value) {
    return TypeThau.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TypeThau.chinhanh,
    );
  }
}

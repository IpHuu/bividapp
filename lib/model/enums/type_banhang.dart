enum TypeBanHang {
  chart,
  loai,
  chinhanh,
  nhasanxuat,
  kenh,
  nhomkhachhang,
  nhomsanpham,
  nhanvien,
  khachhang,
  sanpham,
}

extension TypeBanHangExtension on TypeBanHang {
  int get value {
    switch (this) {
      case TypeBanHang.chart:
        return 1;
      case TypeBanHang.loai:
        return 2;
      case TypeBanHang.chinhanh:
        return 3;
      case TypeBanHang.nhasanxuat:
        return 4;
      case TypeBanHang.kenh:
        return 5;
      case TypeBanHang.nhomkhachhang:
        return 6;
      case TypeBanHang.nhomsanpham:
        return 7;
      case TypeBanHang.nhanvien:
        return 8;
      case TypeBanHang.khachhang:
        return 9;
      case TypeBanHang.sanpham:
        return 10;
    }
  }

  String get name {
    switch (this) {
      case TypeBanHang.loai:
        return "Loại";
      case TypeBanHang.chinhanh:
        return "Chi nhánh";
      case TypeBanHang.nhasanxuat:
        return "Nhà sản xuất";
      case TypeBanHang.kenh:
        return "Kênh";
      case TypeBanHang.nhomkhachhang:
        return "Nhóm khách hàng";
      case TypeBanHang.nhomsanpham:
        return "Nhóm sản phẩm";
      case TypeBanHang.nhanvien:
        return "Nhân viên";
      case TypeBanHang.khachhang:
        return "Khách hàng";
      case TypeBanHang.sanpham:
        return "Sản phẩm";
      default:
        return "";
    }
  }

  static TypeBanHang fromValue(int value) {
    return TypeBanHang.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TypeBanHang.chinhanh,
    );
  }
}

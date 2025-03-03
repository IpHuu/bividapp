// ignore_for_file: constant_identifier_names

import 'package:bividpharma/model/dtos/common/interface.dart';

typedef DocumentFetchPagedCallback = Future<List<IDocument>> Function(
    int pageNo,
    int pageItems,
    bool finished,
    int filterType,
    String searchText);

typedef ChangeStateCallback = void Function(bool value);

typedef FromJsonCallback<T> = T Function(String jsonData);

typedef FromMapCallback<T> = T Function(Map<String, dynamic> mapData);

typedef DynamicVoidCallback = void Function(dynamic item);
typedef DynamicObjectCallbackAsync = Future<void> Function(dynamic item);
typedef DynamicCreateCallback<T> = T Function(dynamic item);
typedef DynamicCallbackAsync<T> = Future<T> Function({dynamic item});

typedef CreateObjectCallback<T> = T Function();

typedef DocumentActionCallback<T> = void Function(T value);

typedef BoolCallback = Future<bool> Function<T>(T value);
typedef TrinhKyActionCallback = void Function(
    DocumentSignAction action, dynamic item);

enum DocumentSignAction {
  add,
  edit,
  delete,
  preview,
  post,
}

class Constants {
  static const String notifyTIMIEKEEPING = 'TIMIEKEEPING';
  static const String notifyORDER = 'ORDER';
  static const String notifySIGNED = 'SIGNED';
  static const String notifySYSTEM = 'SYSTEM';
}

enum DialogAction {
  ok,
  cancel,
  yes,
  no,
  none,
}

enum DepartmentEnum {
  RiengTu,
  TongHop,
  BanHang,
  PhaiThu,
  PhaiTra,
  HangTonKho,
  HoSoUngVien,
  TienLuong,
  ChamSocKhachHang,
  BaoCaoQuanTri,
  HeThong,
  TienMatNganHang,
  Thau,
  MuaHang,
  DieuVan,
  TaiSanCoDinh,
  CongCuDungCu,
  HoSoTaiLieu,
  NghiemCuuPhatTrien,
  TaiChinh,
  MaVach,
  Khac,
  TaiLieuISO_BieuMau,
  TaiLieuISO_PhuLuc,
  TaiLieuISO_SoanThao,
  TaiLieuISO_VanBan,
  TaiLieuISO_YeuCau,
  NhanSu,
  HopDongBaoHiem,
  DanhMucTaiSan,
  QuaTrinhTaiSan,
  HopDongBanThau,
  HopDongBan,
  HopDongMua,
  HopDongPhu,
  HopDongBan_TL,
  HopDongMua_TL,
  HopDongPhu_TL,
  LenhSanXuat,
  DanhGiaKPI,
  CaiTienCongViec,
  Mo_LC_TT,
  POPH3,
  HopDongSanPham,
  NH_TRANO,
  BD_BAOGIA,
  TrangThietBi,
  BoPhanLapTrinh_YeuCau,
  XACNHAN_HOPDONGBAN,
  HD_THEODOIGUIHS,
  XNK_HOPDONGMUA,
  ThongTinTaiXe,
  TheoDoiGiayPhepXe,
  BoPhanThietKe_YeuCau,
  giao_viec_chitiet,
  giao_viec,
  ThongBaoQuyetDinh,
  KeHoachCongViec,
  PhieuTamUng,
  PhieuQuyetToan,
  PhieuDeXuatMuaHang,
  lich_hop,
  ChinhSachBH_DieuChinh,
  GiayNghiPhep,
  GiayRaCong,
  UngPhep,
  LenhCongTac,
  KeHoachCongTac,
  huong_dan,
  giay_phep_kinhdoanh,
  DeXuaTuyenDung,
  DeXuatPhongVan,
  KeHoachDiCongTac,
  DanhGiaPhongVan,
  UngVienNhanViec,
  QuanLyHoSoBJ,
  KeHoachDatHang,
  BaoCaoNgay,
  MucTieuKeHoach,
  LuuTruTaiLieu,
  HD_TAOHOPHONG,
  MA_KEHOACHDAT0,
  DeNghiMuaVVP,
  BANGIAONHANSUMOI,
  BangDuyetGia,
  DeNghiMuaBaoHiem,
  DanhGiaKPINam,
  DanhGiaThuViec,
  DanhGiaCongTacVien,
  DuyetMauNhan,
  CongTacVien,
  BJVietDuc_YeuCau,
  Catalog,
  KPITongHop,
  GP_QUANGCAO,
  GPKH_HTGN,
  BIENBANKIEMHANG,
  TaiLieuKySong,
  GP_VISA_XK,
  GP_GMP,
  YeuCauDangKyHoSo,
  ListBoChungTuHaiQuan,
  XK_DMSP_PP_LIENHE,
  XK_DMSP_PP,
  PhieuPO,
  DKHS_THAU,
  DKHS_THAU_CN,
  MA_VT,
  MA_VT_HINHANH,
  TongHopDatHang,
  BL_CONGTHUCSP,
  BangThuyetMinhCCG,
  MA_KEHOACHDAT0_XNK,
  TT_DANGKY_HOSO,
  UYNHIEMCHI,
  DuyetSanPhamVaCongThucDangKy,
  QuanLyHoSoRND,
  HDLDONLINE,
  PLHDLDONLINE,
  SO_DS_NPP,
  HD_XACNHANCN,
  HT_DSSANPHAM,
  TD_CHUONGTRINHTHUVIEC,
  PhieuPO_TN
}

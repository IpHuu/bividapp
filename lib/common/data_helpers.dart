import 'package:intl/intl.dart';

class DataHelper {
  static const String giayPhepName = 'GIAYPHEP';
  static const String khcvName = 'KHCV';
  static const String tqtName = 'TQTOAN';
  static const String tamUngName = 'TAMUNG';
  static const String deXuatMuaHangName = 'DEXUATMH';
  static const String giayRaCongName = 'GIAYRACONG';
  static const String deNghiCapSimName = 'DENGHICAPSIM';
  static const String deNghiMuaVppName = 'DENGHIMUAVPP';
  static const String lenhCongTacName = 'LENHCONGTAC';
  static const String keHoachCongTacName = 'GIAYKHCONGTAC';
  static const String deNghiCapVppName = 'DENGHICAPVPP';
  static const String chiPhiCongTacName = 'CHIPHICONGTAC';
  static const String phieuYeuCauThietKeName = 'PHIEUYEUCAUTHIETKE';

  static String formatNumberEN(String s) {
    if (s.isEmpty) return '';
    try {
      return NumberFormat.decimalPattern('en').format(double.parse(s));
    } on Exception catch (_) {
      return '';
    }
  }

  static String formatDateString(DateTime? date) {
    if (date == null) return '';
    try {
      final fmd = DateFormat('dd/MM/yyyy');
      final fmt = DateFormat('hh:mm a');
      var sDate = fmd.format(date);
      var sTime = fmt.format(date);
      return 'Ngày $sDate lúc $sTime';
    } on Exception catch (_) {
      return '';
    }
  }

  static String formatDateVn(DateTime? date) {
    if (date == null) return '';
    final ngayText = date.day.toString().padLeft(2, '0');
    final thangText = date.month.toString().padLeft(2, '0');
    final namText = date.year.toString();

    return 'Ngày $ngayText tháng $thangText năm $namText';
  }
}

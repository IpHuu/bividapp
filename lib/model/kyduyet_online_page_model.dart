import 'package:flutter/foundation.dart';

class KyDuyetOnlinePageModel with ChangeNotifier, DiagnosticableTreeMixin {
  late bool _loadingNghiPhep = false;
  late bool _loadingTamUng = false;
  late bool _loadingKHCV = false;

  late bool _loadingTQT = false;
  late bool _loadingDXMH = false;

  late bool _loadingGiayRaCong = false;
  late bool _loadingDeNghiCapSim = false;
  late bool _loadingDeNghiMuaVpp = false;
  late bool _loadingLenhCongTac = false;

  bool get loadingNghiPhep => _loadingNghiPhep;
  set loadingNghiPhep(value) => _loadingNghiPhep = value;

  bool get loadingTamUng => _loadingTamUng;
  set loadingTamUng(value) => _loadingTamUng = value;

  bool get loadingKHCV => _loadingKHCV;
  set loadingKHCV(value) => _loadingKHCV = value;

  bool get loadingTQT => _loadingTQT;
  set loadingTQT(value) => _loadingTQT = value;

  bool get loadingDXMH => _loadingDXMH;
  set loadingDXMH(value) => _loadingDXMH = value;

  bool get loadingGiayRaCong => _loadingGiayRaCong;
  set loadingGiayRaCong(value) => _loadingGiayRaCong = value;

  bool get loadingDeNghiCapSim => _loadingDeNghiCapSim;
  set loadingDeNghiCapSim(value) => _loadingDeNghiCapSim = value;

  bool get loadingDeNghiMuaVpp => _loadingDeNghiMuaVpp;
  set loadingDeNghiMuaVpp(value) => _loadingDeNghiMuaVpp = value;

  bool get loadingLenhCongTac => _loadingLenhCongTac;
  set loadingLenhCongTac(value) => _loadingLenhCongTac = value;

  late bool _loadingKeHoachCongTac = false;
  bool get loadingKeHoachCongTac => _loadingKeHoachCongTac;
  set loadingKeHoachCongTac(value) => _loadingKeHoachCongTac = value;

  late bool _loadingDeNghiCapVpp = false;
  bool get loadingDeNghiCapVpp => _loadingDeNghiCapVpp;
  set loadingDeNghiCapVpp(value) => _loadingDeNghiCapVpp = value;

  late bool _loadingChiPhiCongTac = false;
  bool get loadingChiPhiCongTac => _loadingChiPhiCongTac;
  set loadingChiPhiCongTac(value) => _loadingChiPhiCongTac = value;
}

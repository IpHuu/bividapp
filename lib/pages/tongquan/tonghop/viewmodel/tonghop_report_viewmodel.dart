import 'dart:convert';

import 'package:bividpharma/model/dtos/company/m_company.dart';
import 'package:bividpharma/model/dtos/reports/tonghop/m_tong_hop.dart';
import 'package:bividpharma/model/dtos/vattu/m_vattu.dart';
import 'package:bividpharma/services/providers/report_provider.dart';
import 'package:flutter/material.dart';

class TongHopReportViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  void closeDialog() {
    _errorMessage = null;
    notifyListeners();
  }

  List<List<String>>? data;

  MVatTu? selectedVatTu;
  List<MVatTu> list = [];
  MCompany? selectedCompany;
  List<MCompany> listCompany = [];
  String _fromDate = "${DateTime.now().year}-01-01";
  String _toDate = "${DateTime.now().year}-12-31";

  String get fromDate => _fromDate;
  String get toDate => _toDate;

  void setFromDate(String date) {
    _fromDate = date;
    notifyListeners();
  }

  void setToDate(String date) {
    _toDate = date;
    notifyListeners();
  }

  List<MTongHop>? listTongHop;
  void fetchReport() async {
    setIsLoading(true);
    // final result = await DanhMucRepository.fetchCompanyList();
    // result.fold((error) {
    //   setIsLoading(false);
    // }, (data) {
    //   setIsLoading(false);
    //   print(data);
    //   listCompany = data.data ?? [];
    //   selectedCompany = listCompany.first;
    // });

    final result = await ReportProvider.baoCaoTongHop(
        nam: "2022", tuNam: "2022", denNam: "2025");
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      setIsLoading(false);
      Map<String, dynamic> jsonData = jsonDecode(data.data ?? "");
      List<MTongHop> reports = (jsonData['Table1'] as List)
          .map((item) => MTongHop.fromJson(item))
          .toList();
      listTongHop = reports;
      print(reports);
    });
  }
}

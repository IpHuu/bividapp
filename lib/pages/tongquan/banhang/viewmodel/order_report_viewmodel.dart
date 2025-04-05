import 'dart:convert';

import 'package:bividpharma/model/dtos/company/m_company.dart';
import 'package:bividpharma/model/dtos/reports/banhang/m_bh_report.dart';
import 'package:bividpharma/model/dtos/vattu/m_vattu.dart';
import 'package:bividpharma/model/enums/type_banhang.dart';
import 'package:bividpharma/services/providers/report_provider.dart';
import 'package:flutter/material.dart';

class OrderReportViewmodel with ChangeNotifier {
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

  List<MBHReport> listChart = [];
  List<MBHReport> listSummary = [];
  List<MBHReport> listData = [];
  void fetchReport() async {
    fetchChartData();
    fetchSummaryData();
    // setIsLoading(true);

    // final result = await DanhMucRepository.fetchCompanyList();
    // result.fold((error) {
    //   setIsLoading(false);
    // }, (data) {
    //   setIsLoading(false);
    //   listCompany = data.data ?? [];
    //   selectedCompany = listCompany.first;
    //   fetchChartData();
    //   fetchSummaryData();
    // });
  }

  void fetchData() async {
    setIsLoading(true);
    final result = await ReportProvider.baoCaoBanHang(
        maCty: "002", tuNam: "2020-01-01", denNam: "2020-06-30");
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      setIsLoading(false);
      Map<String, dynamic> jsonData = jsonDecode(data.data ?? "");
      List<MBHReport> reports = (jsonData['Table1'] as List)
          .map((item) => MBHReport.fromJson(item))
          .toList();

      print(reports);
    });
  }

  void fetchChartData() async {
    setIsLoading(true);
    final result = await ReportProvider.baoCaoBanHang(
        maCty: "002", tuNam: "2020-01-01", denNam: "2020-06-30");
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      setIsLoading(false);
      if (data.data == null || data.data!.isEmpty) {
        return;
      }
      Map<String, dynamic> jsonData = jsonDecode(data.data!);
      if (jsonData.containsKey('Table1') && jsonData['Table1'] is List) {
        List<MBHReport> reports = (jsonData['Table1'] as List)
            .map((item) => MBHReport.fromJson(item))
            .toList();
        listChart = reports;
      } else {
        listChart = [];
      }
    });
  }

  void fetchSummaryData() async {
    setIsLoading(true);
    final result = await ReportProvider.baoCaoBanHang(
        type: TypeBanHang.loai,
        maCty: "002",
        tuNam: "2020-01-01",
        denNam: "2020-06-30");
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      setIsLoading(false);
      Map<String, dynamic> jsonData = jsonDecode(data.data ?? "");
      List<MBHReport> reports = (jsonData['Table1'] as List)
          .map((item) => MBHReport.fromJson(item))
          .toList();
      listSummary = reports;
      print(reports);
    });
  }
}

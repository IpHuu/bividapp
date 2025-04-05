import 'dart:convert';

import 'package:bividpharma/model/dtos/company/m_company.dart';
import 'package:bividpharma/model/dtos/reports/thau/m_thau_chart.dart';
import 'package:bividpharma/model/dtos/reports/thau/m_thau_report.dart';
import 'package:bividpharma/model/dtos/reports/thau/m_thau_summary.dart';
import 'package:bividpharma/model/dtos/vattu/m_vattu.dart';
import 'package:bividpharma/services/providers/danhmuc_provider.dart';
import 'package:bividpharma/services/providers/thau_provider.dart';
import 'package:flutter/material.dart';

import '../../../../model/enums/type_thau.dart';

class BiddingReportViewmodel with ChangeNotifier {
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

  List<MThauReport>? listThauData;
  List<MThauSummary>? listSummary;
  List<MThauChart>? listChartData;
  void filterData() async {
    String maCty = selectedCompany?.maCty ?? "";
    fetchDataSummay(
      maCty,
      _fromDate,
      _toDate,
      TypeThau.tongquan,
    );
    fetchChartData(
      selectedCompany?.maCty ?? "",
      _fromDate,
      _toDate,
    );
  }

  void fetchReport() async {
    setIsLoading(true);
    final result = await DanhMucRepository.fetchCompanyList();
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      setIsLoading(false);
      print(data);
      listCompany = data.data ?? [];
      selectedCompany = listCompany.first;
      fetchDataSummay(
        selectedCompany?.maCty ?? "",
        _fromDate,
        _toDate,
        TypeThau.tongquan,
      );
      fetchChartData(
        selectedCompany?.maCty ?? "",
        _fromDate,
        _toDate,
      );
    });
  }

  void fetchDataSummay(
      String macty, String fromDate, String toDate, TypeThau type) async {
    setIsLoading(true);
    final result = await ThauProvider.baoCaoThau(
        macty: macty, from: fromDate, to: toDate, type: type);
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      setIsLoading(false);
      Map<String, dynamic> jsonData = jsonDecode(data.data ?? "");
      listSummary = (jsonData['Table1'] as List)
          .map((item) => MThauSummary.fromJson(item))
          .toList();
      print(listSummary);
    });
  }

  void fetchChartData(String macty, String fromDate, String toDate) async {
    setIsLoading(true);
    final result = await ThauProvider.baoCaoThau(
        macty: macty, from: fromDate, to: toDate, type: TypeThau.thang);
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      setIsLoading(false);
      Map<String, dynamic> jsonData = jsonDecode(data.data ?? "");
      listChartData = (jsonData['Table1'] as List)
          .map((item) => MThauChart.fromJson(item))
          .toList();
      print(listChartData);
    });
  }

  void fetchData(TypeThau type) async {
    setIsLoading(true);
    final result = await ThauProvider.baoCaoThau(type: type);
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      setIsLoading(false);
      Map<String, dynamic> jsonData = jsonDecode(data.data ?? "");
      List<MThauReport> reports = (jsonData['Table1'] as List)
          .map((item) => MThauReport.fromJson(item))
          .toList();
      listThauData = reports;
      print(listThauData);
    });
  }
}

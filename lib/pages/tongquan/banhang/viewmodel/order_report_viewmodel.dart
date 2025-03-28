import 'package:bividpharma/model/dtos/company/m_company.dart';
import 'package:bividpharma/model/dtos/vattu/m_vattu.dart';
import 'package:bividpharma/services/providers/danhmuc_provider.dart';
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
    });
  }
}

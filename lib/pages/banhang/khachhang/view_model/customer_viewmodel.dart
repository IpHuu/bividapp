import 'package:bividpharma/model/dtos/customer/m_customer.dart';
import 'package:bividpharma/services/providers/customer_provider.dart';
import 'package:flutter/foundation.dart';

class CustomerViewModel extends ChangeNotifier {
  List<MCustomer> _customerList = [];

  List<MCustomer> get customerList => _customerList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoginLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  void closeDialog() {
    _errorMessage = null;
    notifyListeners();
  }

  int limit = 10;
  int offset = 0;
  String search = "";
  int totalRecords = 0;
  bool hasMoreData = true;

  void fetchCustomerList() async {
    _isLoading = true;
    notifyListeners();
    final response = await CustomerProvider.fetchCustomerList(
        search: search, offset: offset, limit: limit);

    response.fold((error) {
      print("Lỗi: ${error.message}");
      _errorMessage = error.message;
      _isLoading = false;
      notifyListeners();
    }, (result) {
      _isLoading = false;
      _customerList = result.data ?? [];
      totalRecords = result.pagination?.total ?? 0;
      notifyListeners();
    });
  }

  void loadMoreData() async {
    if (_isLoading) return;
    if (!hasMoreData) return;
    offset += limit;
    if (offset + limit >= totalRecords) {
      hasMoreData = false;
      print("Hết dữ liệu");
      return;
    }
    _isLoading = true;
    notifyListeners();
    final response = await CustomerProvider.fetchCustomerList(
        search: search, offset: offset, limit: limit);

    response.fold((error) {
      print("Lỗi: ${error.message}");
      _errorMessage = error.message;
      _isLoading = false;
      notifyListeners();
    }, (result) {
      _customerList.addAll(result.data ?? []);
      totalRecords = result.pagination?.total ?? 0;
      _isLoading = false;
      notifyListeners();
    });
  }
}

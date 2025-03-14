import 'package:bividpharma/model/dtos/donbanhang/m_order.dart';
import 'package:bividpharma/pages/banhang/listproduct/view_model/product_list_vm.dart';
import 'package:bividpharma/services/providers/orders_provider.dart';
import 'package:bividpharma/services/providers/product_provider.dart';
import 'package:flutter/material.dart';

class OrdersViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSearchClicked = false;
  bool get isSearchClicked => _isSearchClicked;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  set isSearchClicked(bool value) {
    _isSearchClicked = value;
    notifyListeners();
  }

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

  List<MOrder> _orderList = [];

  List<MOrder> get orderList => _orderList;

  int limit = 10;
  int offset = 0;
  String search = "";
  int totalRecords = 0;
  bool hasMoreData = true;

  void loadMoreData() async {
    if (_isLoading) return;
    if (!hasMoreData) return;
    // _isLoading = true;
    // notifyListeners();
    offset += limit;
    if (offset + limit >= totalRecords) {
      hasMoreData = false;
      print("Hết dữ liệu");
      return;
    }
    _isLoading = true;
    notifyListeners();
    final result = await OrdersProvider.fetchOrderList2(
        search: search, offset: offset, limit: limit);
    result.fold(
      (error) {
        print("Lỗi: ${error.message}");
        _errorMessage = error.message;
        _isLoading = false;
        notifyListeners();
      },
      (response) {
        _isLoading = false;
        _orderList.addAll(response.data ?? []);
        totalRecords = response.pagination?.total ?? 0;
        notifyListeners();
      },
    );
  }

  Future<void> fetchOrders() async {
    offset = 0;
    limit = 10;
    _isLoading = true;
    notifyListeners();
    final result = await OrdersProvider.fetchOrderList2(
        search: search, offset: offset, limit: limit);
    result.fold(
      (error) {
        print("Lỗi: ${error.message}");
        _errorMessage = error.message;
        _isLoading = false;
        notifyListeners();
      },
      (response) {
        _isLoading = false;
        _orderList = response.data ?? [];
        totalRecords = response.pagination?.total ?? 0;
        notifyListeners();
      },
    );
  }

  void callDemo() async {
    print("Call demo");
  }
}

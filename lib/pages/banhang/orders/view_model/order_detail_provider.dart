import 'package:bividpharma/model/dtos/order/m_order_detail.dart';
import 'package:bividpharma/model/dtos/order/m_order_product.dart';
import 'package:bividpharma/services/providers/orders_repo.dart';
import 'package:flutter/material.dart';

class OrderDetailProvider with ChangeNotifier {
  MOrderDetail? mOrderDetail;

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

  void getOrderDetail(int orderId) async {
    final response = await OrdersRepo.getOrderDetail(orderId: orderId);

    response.fold((error) {}, (result) {
      mOrderDetail = result.data;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // Xóa danh sách sản phẩm khi thoát màn hình
    super.dispose();
  }
}

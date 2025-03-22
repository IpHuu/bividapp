import 'package:bividpharma/model/dtos/order/m_order_detail.dart';
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

  void saveOrderDetail() {
    print(mOrderDetail?.orderStatus ?? 0);
  }

  void updateStatusOrder(int orderStatusId) {
    if (mOrderDetail != null) {
      mOrderDetail = mOrderDetail!.copyWith(orderStatus: orderStatusId);
    }
  }

  void removeProduct(int productId) {
    if (mOrderDetail?.orderDetails != null) {
      final updatedList = mOrderDetail!.orderDetails!
          .where((product) => product.id != productId)
          .toList();
      mOrderDetail = mOrderDetail!.copyWith(orderDetails: updatedList);
      notifyListeners();
    }
  }

  void updateProduct(int price, int quantity, int productId) {
    if (mOrderDetail?.orderDetails != null) {
      final updatedList = mOrderDetail!.orderDetails!.map((product) {
        if (product.id == productId) {
          return product.copyWith(price: price, quantity: quantity);
        }
        return product;
      }).toList();
      mOrderDetail = mOrderDetail!.copyWith(orderDetails: updatedList);
    }
  }

  @override
  void dispose() {
    // Xóa danh sách sản phẩm khi thoát màn hình
    super.dispose();
  }
}

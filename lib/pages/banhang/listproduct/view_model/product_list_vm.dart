import 'package:bividpharma/model/dtos/products/m_product.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/create_order_provider.dart';
import 'package:bividpharma/services/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class ProductListVm extends ChangeNotifier {
//   final CreateOrderProvider _createOrderProvider;

//   ProductListVm(this._createOrderProvider);

//   List<MProduct> _productList = [];

//   List<MProduct> get productList => _productList;

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//   void setLoginLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }

//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;

//   void setErrorMessage(String value) {
//     _errorMessage = value;
//     notifyListeners();
//   }

//   void closeDialog() {
//     _errorMessage = null;
//     notifyListeners();
//   }

//   int limit = 10;
//   int offset = 0;
//   String search = "";
//   int totalRecords = 0;
//   bool hasMoreData = true;

//   void fetchProductList(
//       {int offset = 0, int limit = 10, bool isLoadMore = false}) async {
//     if (_isLoading) return;

//     if (!hasMoreData) {
//       print("Hết dữ liệu");
//       return;
//     }

//     _isLoading = true;
//     notifyListeners();

//     if (isLoadMore) {
//       offset += limit;
//     }

//     final response = await ProductsRepository.fetchProductList(
//         search: search, offset: offset, limit: limit);

//     response.fold(
//       (error) {
//         print("Lỗi: ${error.message}");
//         _errorMessage = error.message;
//         _isLoading = false;
//         notifyListeners();
//       },
//       (result) {
//         _isLoading = false;

//         if (isLoadMore) {
//           _productList.addAll(result.data ?? []);
//         } else {
//           _productList = result.data ?? [];
//         }
//         totalRecords = result.pagination?.total ?? 0;
//         hasMoreData = totalRecords > _productList.length;
//         notifyListeners();
//       },
//     );
//   }

//   void selectProduct(BuildContext context, MProduct product) {
//     // Đảo trạng thái isSelected bằng copyWith
//     final updatedProduct = product.copyWith(isSelected: !product.isSelected);

//     // Nếu sản phẩm được chọn, thêm vào danh sách đơn hàng
//     if (updatedProduct.isSelected) {
//       _createOrderProvider.addProduct(updatedProduct);
//     } else {
//       // Nếu bỏ chọn, loại khỏi danh sách đơn hàng
//       _createOrderProvider.removeProduct(updatedProduct);
//     }

//     // Cập nhật danh sách trong ProductListVm
//     final index = _productList.indexWhere((p) => p.prdCode == product.prdCode);
//     if (index != -1) {
//       _productList[index] = updatedProduct;
//       notifyListeners();
//     }
//   }

//   void syncSelectedProducts() {
//     if (_createOrderProvider.selectedProducts.isEmpty) {
//       return;
//     }
//     for (var i = 0; i < _productList.length; i++) {
//       if (_createOrderProvider.selectedProducts
//           .any((selected) => selected.prdCode == _productList[i].prdCode)) {
//         _productList[i] = _productList[i].copyWith(isSelected: true);
//       }
//     }
//     notifyListeners();
//   }
// }

import 'package:bividpharma/model/dtos/customer/m_customer.dart';
import 'package:bividpharma/model/dtos/products/m_product.dart';
import 'package:bividpharma/pages/banhang/listproduct/view_model/product_list_vm.dart';
import 'package:bividpharma/services/providers/product_provider.dart';
import 'package:flutter/material.dart';

class CreateOrderProvider with ChangeNotifier {
  TextEditingController addressController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<MProduct> selectedProducts = [];
  MCustomer? _selectedCustomer;
  MCustomer? get selectedCustomer => _selectedCustomer;
  List<MProduct> _productList = [];

  List<MProduct> get productList => _productList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoginLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setSelectedCustomer(MCustomer? customer) {
    _selectedCustomer = customer;
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

  void fetchProductList(
      {int offset = 0, int limit = 10, bool isLoadMore = false}) async {
    if (_isLoading) return;

    if (!hasMoreData) {
      print("Hết dữ liệu");
      return;
    }

    _isLoading = true;
    notifyListeners();

    if (isLoadMore) {
      offset += limit;
    }

    final response = await ProductsRepository.fetchProductList(
        search: search, offset: offset, limit: limit);

    response.fold(
      (error) {
        print("Lỗi: ${error.message}");
        _errorMessage = error.message;
        _isLoading = false;
        notifyListeners();
      },
      (result) {
        _isLoading = false;

        if (isLoadMore) {
          _productList.addAll(result.data ?? []);
        } else {
          _productList = result.data ?? [];
        }
        totalRecords = result.pagination?.total ?? 0;
        hasMoreData = totalRecords > _productList.length;
        syncSelectedProducts();
        notifyListeners();
      },
    );
  }

  void addProduct(MProduct product) {
    if (!selectedProducts.contains(product)) {
      selectedProducts.add(product);
      print("Đã thêm sản phẩm: ${product.prdName}");
      notifyListeners();
    }
  }

  void removeProduct(MProduct product) {
    selectedProducts.remove(product);
    notifyListeners();
  }

  void clear() {
    selectedProducts.clear();
    _selectedCustomer = null;
    notifyListeners();
  }

  void selectProduct(BuildContext context, MProduct product) {
    // Đảo trạng thái isSelected bằng copyWith
    final updatedProduct = product.copyWith(isSelected: !product.isSelected);

    // Nếu sản phẩm được chọn, thêm vào danh sách đơn hàng
    if (updatedProduct.isSelected) {
      selectedProducts.add(updatedProduct);
    } else {
      // Nếu bỏ chọn, loại khỏi danh sách đơn hàng
      selectedProducts.remove(updatedProduct);
    }

    // Cập nhật danh sách trong ProductListVm
    final index = _productList.indexWhere((p) => p.prdCode == product.prdCode);
    if (index != -1) {
      _productList[index] = updatedProduct;
      notifyListeners();
    }
  }

  void syncSelectedProducts() {
    if (selectedProducts.isEmpty) {
      return;
    }
    for (var i = 0; i < _productList.length; i++) {
      if (selectedProducts
          .any((selected) => selected.prdCode == _productList[i].prdCode)) {
        _productList[i] = _productList[i].copyWith(isSelected: true);
      }
    }
    notifyListeners();
  }

  void updatedProduct(int index, int quantity, double price) {
    selectedProducts[index] =
        selectedProducts[index].copyWith(quantity: quantity, price: price);
    notifyListeners();
  }

  @override
  void dispose() {
    // Xóa danh sách sản phẩm khi thoát màn hình
    super.dispose();
  }
}

import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/model/dtos/products/m_product.dart';
import 'package:bividpharma/pages/banhang/khachhang/view_model/customer_viewmodel.dart';
import 'package:bividpharma/pages/banhang/listproduct/view_model/product_list_vm.dart';
import 'package:bividpharma/pages/banhang/orders/view/create_order_view.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/create_order_provider.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProductListView();
  }
}

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;

  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CreateOrderProvider>(context, listen: false)
          .fetchProductList();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          Provider.of<CreateOrderProvider>(context, listen: false)
              .fetchProductList(isLoadMore: true);
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final viewModel = context.watch<CreateOrderProvider>();
    if (viewModel.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.scale,
          title: "Thông báo",
          titleTextStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          desc: viewModel.errorMessage,
          descTextStyle: const TextStyle(color: Colors.red, fontSize: 16),
          btnOkColor: Theme.of(context).primaryColor,
          btnOkOnPress: () {
            viewModel.closeDialog();
          },
        ).show();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    print(value);
    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () {
      print("Start search $value");
      final viewModel =
          Provider.of<CreateOrderProvider>(context, listen: false);
      viewModel.search = value;
      viewModel.fetchProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreateOrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: isSearchClicked
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: const InputDecoration(
                      hintText: "Tìm kiếm",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )
            : const Text("Danh sách sản phẩm"),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isSearchClicked ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearchClicked = !isSearchClicked;
                if (!isSearchClicked) {
                  _searchController.clear();
                  viewModel.search = "";
                  viewModel.hasMoreData = true;
                  viewModel.fetchProductList();
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Xử lý khi bấm vào icon
            },
          ),
        ],
      ),
      body: Consumer<CreateOrderProvider>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: viewModel.productList.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.productList[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ProductCard2(product: product));
                  },
                ),
              ),
              // if (viewModel.isLoading)
              //   const Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: CircularProgressIndicator(),
              //   ),
            ],
          );
        },
      ),
    );
  }
}

class ProductCard2 extends StatelessWidget {
  final MProduct product;
  const ProductCard2({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreateOrderProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        spacing: 8,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[100], // Màu nền của vòng tròn
            ),
            child: IconButton(
              icon: product.isSelected
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                    )
                  : const Icon(Icons.add, color: Colors.grey), // Màu của icon
              onPressed: () {
                // Xử lý khi bấm vào nút add

                viewModel.selectProduct(context, product);
              },
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                // Viền nhạt
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dòng mã sản phẩm, lô hàng, mã kho
                  Row(
                    children: [
                      Text("Mã sp: ${product.prdCode}",
                          style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Tên sản phẩm
                  Text(
                    product.prdName ?? "",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.producer?.prd_manuf_name ?? "",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[500]),
                  ),
                  const SizedBox(height: 5),
                  // Thông tin sản phẩm (Grid)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cột trái
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Giá bán / Đơn vị tính:",
                                style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ),

                      // Cột phải
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                "${NumberFormat('#,###').format(product.prdSellPrice ?? 0.0)}đ / ${product.unit?.prd_unit_name ?? ""}",
                                style: const TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

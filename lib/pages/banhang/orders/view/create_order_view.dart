import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/model/dtos/products/m_product.dart';
import 'package:bividpharma/pages/banhang/khachhang/customer_page.dart';
import 'package:bividpharma/pages/banhang/khachhang/view_model/customer_viewmodel.dart';
import 'package:bividpharma/pages/banhang/orders/view/edit_product_popup.dart';
import 'package:bividpharma/pages/banhang/orders/view/order_detail_view.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/create_order_provider.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/orders_view_model.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CreateOrderView extends StatefulWidget {
  const CreateOrderView({Key? key}) : super(key: key);

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CreateOrderProvider>(context, listen: false).clear();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final viewModel = context.watch<CreateOrderProvider>();

    if (viewModel.errorMessage != null || viewModel.successMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AwesomeDialog(
          context: context,
          dialogType: viewModel.errorMessage != null
              ? DialogType.error
              : DialogType.success,
          animType: AnimType.scale,
          title: "Thông báo",
          titleTextStyle: TextStyle(
            color: viewModel.errorMessage != null ? Colors.red : Colors.green,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          desc: viewModel.errorMessage ?? viewModel.successMessage,
          descTextStyle: const TextStyle(fontSize: 16),
          btnOkColor:
              viewModel.errorMessage != null ? Colors.red : Colors.green,
          btnOkOnPress: () {
            viewModel.closeDialog();
            // Nếu là thông báo thành công, chuyển qua màn hình khác
            if (viewModel.isCreateOrderSuccess && viewModel.orderId != null) {
              Future.delayed(const Duration(milliseconds: 300), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderDetailView(
                            orderId: viewModel.orderId!,
                          )), // Màn hình mới
                );
              });
            }
          },
        ).show();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _selectCustomer(BuildContext context) async {
    final selectedCustomer = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomerView(),
      ),
    );

    if (selectedCustomer != null) {
      print("Khách hàng đã chọn: ${selectedCustomer.customer_name}");
      var viewModel = context.read<CreateOrderProvider>();
      viewModel.setSelectedCustomer(selectedCustomer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateOrderProvider>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tạo Đơn Hàng",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          titleTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                // Add your action here
                print("Lưu đơn hàng");
                viewModel.createOrder();
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.grey[100], // Thêm màu nền cho toàn bộ body
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Mã đối tượng",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      buildDropdown(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Mã giao dịch",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                Text(
                                    viewModel.selectedCustomer?.customer_code ??
                                        "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hợp đồng",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text("********",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text("Địa chỉ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: TextEditingController(
                          text: viewModel.selectedCustomer?.customer_addr ?? "",
                        ),
                        maxLines: 2, // Tạo ô nhập văn bản nhiều dòng
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Viền khi không focus
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            // Viền khi focus vào
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text("Diễn giải",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: viewModel.noteController,
                        maxLines: 5, // Tạo ô nhập văn bản nhiều dòng
                        decoration: InputDecoration(
                          hintText: "Example Text",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Viền khi không focus
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            // Viền khi focus vào
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white, // Màu nền trắng
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ), // Bo góc chỉ topLeft và topRight
                    // Viền mỏng
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sản phẩm (${viewModel.selectedProducts.length})",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(
                                  Icons.shopping_bag_outlined), // Icon giỏ hàng
                              onPressed: () {
                                // Add your action here
                                MyNavigation.intentWithData(
                                  ScreenRouteName.productListView,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: viewModel.selectedProducts.length,
                        itemBuilder: (context, index) {
                          final product = viewModel.selectedProducts[index];
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ProductCard(
                                product: product,
                                index: index,
                              ));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildDropdown() {
    final viewModel = context.read<CreateOrderProvider>();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              viewModel.selectedCustomer?.customer_name ?? "Chọn khách hàng",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            _selectCustomer(context);
            // MyNavigation.intentWithData(
            //   ScreenRouteName.customerListView,
            // );
          },
        ),
      ],
    );
  }

  // Widget hiển thị từng dòng thông tin
  Widget infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$label: ", style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  void showEditProductPopup(BuildContext context, String title, int quantity,
      double price, Function(int, double) onSave) {
    showDialog(
      context: context,
      builder: (context) => EditProductPopup(
        title: title,
        initialQuantity: quantity,
        initialPrice: price,
        onSave: onSave,
      ),
    );
  }

  MProduct product;
  int index;
  ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          Row(
            spacing: 8,
            children: [
              Text("Mã sp: ${product.prdCode ?? ""}",
                  style: const TextStyle(color: Colors.black54)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.black54),
                onPressed: () {
                  double? price =
                      product.price != 0 ? product.price : product.prdSellPrice;
                  showEditProductPopup(
                    context,
                    product.prdCode ?? "",
                    product.quantity,
                    price ?? 0,
                    (updatedQuantity, updatedPrice) {
                      final viewModel = context.read<CreateOrderProvider>();
                      viewModel.updatedProduct(
                          index, updatedQuantity, updatedPrice);
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.black54),
                onPressed: () {
                  final viewModel = context.read<CreateOrderProvider>();
                  viewModel.removeProduct(product);
                },
              ),
            ],
          ),

          // Tên sản phẩm
          Text(
            product.prdName ?? "",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 12),
          Row(
            spacing: 8,
            children: [
              Text("Số lượng: ${product.quantity}",
                  style: const TextStyle(color: Colors.black54)),
              const Spacer(),
              Text(
                "Giá bán: ${product.price != 0 ? product.price : product.prdSellPrice}",
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

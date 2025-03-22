import 'package:bividpharma/model/dtos/order/m_order_detail.dart';
import 'package:bividpharma/model/dtos/order/m_order_product.dart';
import 'package:bividpharma/pages/banhang/orders/order_detail/provider/order_detail_provider.dart';
import 'package:bividpharma/pages/banhang/orders/order_list/widgets/edit_product_popup.dart';
import 'package:bividpharma/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/order_summary_cart.dart';

class OrderDetailView extends StatefulWidget {
  final int orderId;
  const OrderDetailView({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderDetailProvider>(context, listen: false)
          .getOrderDetail(widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chi tiết đơn hàng",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
        ],
      ),
      body: const OrderOverviewScreen(),
    );
  }
}

class OrderOverviewScreen extends StatelessWidget {
  const OrderOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailProvider>(builder: (context, viewModel, child) {
      return Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Tổng quan đơn hàng
                    OrderSummaryCard(orderDetail: viewModel.mOrderDetail),

                    const SizedBox(height: 8),

                    // Tổng quan thành tiền
                    TotalSummaryCard(orderDetail: viewModel.mOrderDetail),

                    const SizedBox(height: 8),
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
                                "Sản phẩm (${viewModel.mOrderDetail?.orderDetails?.length ?? 0})",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                viewModel.mOrderDetail?.orderDetails?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              final product =
                                  viewModel.mOrderDetail?.orderDetails?[index];
                              return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: OrderProductCard(
                                    product: product!,
                                  ));
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              // Nút hành động cố định ở bottom
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                color: Colors.white,
                child: const ActionButtons(),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class OrderProductCard extends StatelessWidget {
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

  MOrderProductList product;
  OrderProductCard({Key? key, required this.product}) : super(key: key);

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
              Text("Mã sp: ${product.product_code ?? ""}",
                  style: const TextStyle(color: Colors.black54)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.black54),
                onPressed: () {
                  double? price = product.price.toDouble();
                  showEditProductPopup(context, product.product_code ?? "",
                      product.quantity, price, (updatedQuantity, updatedPrice) {
                    final viewModel = context.read<OrderDetailProvider>();
                    viewModel.updateProduct(updatedPrice.toInt(),
                        updatedQuantity, product.product_id!);
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.black54),
                onPressed: () {
                  final viewModel = context.read<OrderDetailProvider>();
                  viewModel.removeProduct(product.id!);
                },
              ),
            ],
          ),

          // Tên sản phẩm
          Text(
            product.productName,
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
                "Giá bán: ${product.price.toCurrency()}",
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget: Tổng quan thành tiền
class TotalSummaryCard extends StatelessWidget {
  MOrderDetail? orderDetail;
  TotalSummaryCard({Key? key, required this.orderDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 60,
        maxHeight: double.infinity,
      ),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tổng cộng",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text((orderDetail?.totalMoney ?? 0.0).toCurrency(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Widget: Nút hành động
class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text("Lịch sử cập nhật",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              final viewModel = context.read<OrderDetailProvider>();
              viewModel.saveOrderDetail();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text("Lưu",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:bividpharma/pages/banhang/orders/view_model/order_detail_provider.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  const OrderSummaryCard(),

                  const SizedBox(height: 8),

                  // Tổng quan thành tiền
                  const TotalSummaryCard(),

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
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Sản phẩm ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),

                        // ListView.builder(
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: viewModel.selectedProducts.length,
                        //   itemBuilder: (context, index) {
                        //     final product = viewModel.selectedProducts[index];
                        //     return Padding(
                        //         padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //         child: ProductCard(
                        //           product: product,
                        //           index: index,
                        //         ));
                        //   },
                        // )
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
  }
}

// Widget: Tổng quan đơn hàng
class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 100,
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
              children: [
                const Text("Tổng quan đơn hàng",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Khởi tạo",
                      style: TextStyle(color: Colors.green[800], fontSize: 12)),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mã đơn", style: TextStyle(fontSize: 14)),
                Text("#121414",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Thời gian", style: TextStyle(fontSize: 14)),
                Text("10/10/2025",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Người đặt", style: TextStyle(fontSize: 14)),
                Text("Nguyễn Thị Trinh",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Tên đối tượng",
                style: TextStyle(color: Colors.black54)),
            const Text("Công ty TNHH MTV ABC",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Diễn giải", style: TextStyle(color: Colors.black54)),
            const Text("Description"),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label1, String value1, String label2, String value2,
      {Color statusColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text("$label1: $value1")),
          Expanded(
              child: Text("$label2: $value2",
                  style: TextStyle(color: statusColor),
                  textAlign: TextAlign.right)),
        ],
      ),
    );
  }
}

// Widget: Tổng quan thành tiền
class TotalSummaryCard extends StatelessWidget {
  const TotalSummaryCard({Key? key}) : super(key: key);

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
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tổng cộng",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("\$1,387.26",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
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
            onPressed: () {},
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

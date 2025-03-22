import 'package:bividpharma/model/dtos/common/order_status.dart';
import 'package:bividpharma/model/dtos/order/m_order_detail.dart';
import 'package:bividpharma/pages/banhang/orders/order_detail/provider/order_detail_provider.dart';
import 'package:bividpharma/ui/widgets/status_order_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSummaryCard extends StatefulWidget {
  final MOrderDetail? orderDetail;

  const OrderSummaryCard({Key? key, required this.orderDetail})
      : super(key: key);

  @override
  _OrderSummaryCardState createState() => _OrderSummaryCardState();
}

// Widget: Tổng quan đơn hàng
class _OrderSummaryCardState extends State<OrderSummaryCard> {
  MOrderDetail? orderDetail;
  @override
  void initState() {
    super.initState();
    orderDetail = widget.orderDetail;
  }

  @override
  void didUpdateWidget(covariant OrderSummaryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.orderDetail != widget.orderDetail) {
      setState(() {
        orderDetail = widget.orderDetail;
      });
    }
  }

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
                OrderStatusDropdown(
                  orderStatusId: orderDetail?.orderStatus ?? 1,
                  onStatusChanged: (value) {
                    context
                        .read<OrderDetailProvider>()
                        .updateStatusOrder(value.id);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Mã đơn", style: TextStyle(fontSize: 14)),
                Text(orderDetail?.outputCode ?? "",
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Thời gian", style: TextStyle(fontSize: 14)),
                Text(orderDetail?.created ?? "",
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Người đặt", style: TextStyle(fontSize: 14)),
                Text(orderDetail?.userOrderName ?? "",
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Tên đối tượng",
                style: TextStyle(color: Colors.black54)),
            Text(orderDetail?.customerName ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Diễn giải", style: TextStyle(color: Colors.black54)),
            Text(orderDetail?.notes ?? ""),
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

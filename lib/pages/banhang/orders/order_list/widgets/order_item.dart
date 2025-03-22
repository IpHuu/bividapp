import 'package:bividpharma/model/dtos/common/order_status.dart';
import 'package:bividpharma/model/dtos/donbanhang/m_order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final MOrder order;

  const OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 100,
        maxHeight: double.infinity,
      ),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Số chứng từ và ngày tạo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mã đơn hàng: ${order.output_code}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: StatusOrder.getById(order.orderStatus ?? 1)
                      .backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(StatusOrder.getById(order.orderStatus ?? 1).name,
                    style: TextStyle(
                        color: StatusOrder.getById(order.orderStatus ?? 1)
                            .textColor,
                        fontSize: 12)),
              )
            ],
          ),
          Text("Ngày đặt: ${order.created}",
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const Divider(
            color: Colors.grey,
          ),
          // Tên công ty
          Text(order.customerName,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 8),

          // Trạng thái & Kiểm tra
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Người đặt", style: TextStyle(fontSize: 14)),
              Text(order.userOrder,
                  style: const TextStyle(fontSize: 14, color: Colors.black54)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Khu vực", style: TextStyle(fontSize: 14)),
              Text(order.storeName,
                  style: const TextStyle(fontSize: 14, color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 8),
          // Tổng tiền
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tổng tiền",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text("${NumberFormat('#,###').format(order.total_money)}đ",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value, {bool isBold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 12, color: Colors.black54)),
        Text(value,
            style: TextStyle(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}

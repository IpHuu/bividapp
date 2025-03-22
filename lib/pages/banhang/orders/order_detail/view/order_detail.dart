import 'package:bividpharma/pages/banhang/orders/order_detail/provider/order_detail_provider.dart';
import 'package:bividpharma/pages/banhang/orders/order_detail/view/order_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final orderId = args?['orderId'] ?? 0;
    return ChangeNotifierProvider(
      create: (_) => OrderDetailProvider(),
      child: OrderDetailView(
        orderId: orderId,
      ),
    );
  }
}

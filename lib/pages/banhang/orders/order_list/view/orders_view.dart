import 'package:bividpharma/pages/banhang/orders/order_list/provider/orders_view_model.dart';
import 'package:bividpharma/pages/banhang/orders/order_list/view/order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrdersViewModel()),
      ],
      child: const OrderListView(),
    );
  }
}

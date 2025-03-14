import 'package:bividpharma/pages/banhang/khachhang/view_model/customer_viewmodel.dart';
import 'package:bividpharma/pages/banhang/listproduct/view_model/product_list_vm.dart';
import 'package:bividpharma/pages/banhang/orders/view/order_list_view.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/orders_view_model.dart';
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

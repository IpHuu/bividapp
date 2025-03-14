import 'package:bividpharma/pages/banhang/listproduct/view_model/product_list_vm.dart';
import 'package:bividpharma/pages/banhang/orders/view/create_order_view.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/create_order_provider.dart';
import 'package:bividpharma/pages/banhang/orders/view_model/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateOrderView();
  }
}

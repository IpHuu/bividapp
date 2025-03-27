import 'package:bividpharma/ui/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class OrderReportView extends StatelessWidget {
  const OrderReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OrderReportPage();
  }
}

class OrderReportPage extends StatefulWidget {
  const OrderReportPage({Key? key}) : super(key: key);

  @override
  State<OrderReportPage> createState() => _OrderReportPageState();
}

class _OrderReportPageState extends State<OrderReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarInline(
        title: "Tổng quan bán hàng",
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Xử lý khi bấm vào icon
            },
          ),
        ],
      ),
      body: const Text("data"),
    );
  }
}

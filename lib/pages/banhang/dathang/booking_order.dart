import 'package:bividpharma/pages/banhang/dathang/view_model/invoice_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InvoiceViewmodel(),
      child: const BookingOrder(),
    );
  }
}

class BookingOrder extends StatefulWidget {
  const BookingOrder({Key? key}) : super(key: key);

  @override
  State<BookingOrder> createState() => _BookingOrderState();
}

class _BookingOrderState extends State<BookingOrder> {
  @override
  void initState() {
    super.initState();
    // Gọi fetchInvoices khi view xuất hiện
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InvoiceViewmodel>(context, listen: false).fetchInvoices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceViewmodel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Đặt hàng"),
          titleTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Xử lý khi bấm vào icon
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Xử lý khi bấm vào icon
              },
            ),
          ],
        ),
        body: const Text("Hello Đặt hàng"),
      );
    });
  }
}

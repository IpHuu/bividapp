import 'package:flutter/material.dart';

class BookingOrder extends StatefulWidget {
  const BookingOrder({Key? key}) : super(key: key);

  @override
  State<BookingOrder> createState() => _BookingOrderState();
}

class _BookingOrderState extends State<BookingOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đặt hàng"),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Xử lý khi bấm vào icon
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Xử lý khi bấm vào icon
            },
          ),
        ],
      ),
      body: Text("Hello Đặt hàng"),
    );
  }
}

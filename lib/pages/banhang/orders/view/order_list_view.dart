import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/model/dtos/donbanhang/m_order.dart';
import 'package:bividpharma/pages/banhang/orders/view/order_item.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../view_model/orders_view_model.dart';

class OrderListView extends StatefulWidget {
  const OrderListView({Key? key}) : super(key: key);

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  final TextEditingController _searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  Timer? _debounce;
  @override
  void initState() {
    super.initState();

    // Provider.of<OrdersViewModel>(context, listen: false).fetchOrders();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrdersViewModel>(context, listen: false).fetchOrders();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          Provider.of<OrdersViewModel>(context, listen: false).loadMoreData();

          Future.delayed(const Duration(milliseconds: 100), () {
            if (mounted) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent - 50,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              );
            }
          });
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final viewModel = context.watch<OrdersViewModel>();

    if (viewModel.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.scale,
          title: "Thông báo",
          titleTextStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          desc: viewModel.errorMessage,
          descTextStyle: const TextStyle(color: Colors.red, fontSize: 16),
          btnOkColor: Theme.of(context).primaryColor,
          btnOkOnPress: () {
            viewModel.closeDialog();
          },
        ).show();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    print(value);
    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () {
      print("Start search $value");
      final viewModel = Provider.of<OrdersViewModel>(context, listen: false);
      viewModel.search = value;
      viewModel.fetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: viewModel.isSearchClicked
              ? Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      decoration: const InputDecoration(
                        hintText: "Tìm kiếm",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                )
              : const Text(
                  "Đơn hàng",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          titleTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          actions: [
            IconButton(
              icon:
                  Icon(viewModel.isSearchClicked ? Icons.close : Icons.search),
              onPressed: () {
                // Xử lý khi bấm vào icon
                viewModel.isSearchClicked = !viewModel.isSearchClicked;
                if (!viewModel.isSearchClicked) {
                  _searchController.clear();
                  viewModel.search = "";
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Xử lý khi bấm vào icon
                MyNavigation.intentWithData(
                  ScreenRouteName.createOrderView,
                );
              },
            ),
          ],
        ),
        body: Consumer<OrdersViewModel>(
          builder: (context, viewModel, child) {
            // return const Center(child: CircularProgressIndicator());
            return Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                      "Tổng cộng: ${viewModel.orderList.length} / ${viewModel.totalRecords} đơn",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300)),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      viewModel.search = "";
                      viewModel.fetchOrders();
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _scrollController,
                      itemCount: viewModel.orderList.length + 1,
                      itemBuilder: (context, index) {
                        if (index < viewModel.orderList.length) {
                          final order = viewModel.orderList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: OrderItem(order: order),
                          );
                        } else {
                          return viewModel.isLoading
                              ? const Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                )
                              : const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}

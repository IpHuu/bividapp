import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/model/dtos/customer/m_customer.dart';
import 'package:bividpharma/pages/banhang/khachhang/view_model/customer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomerViewModel()),
      ],
      child: const CustomerListView(),
    );
  }
}

class CustomerListView extends StatefulWidget {
  const CustomerListView({Key? key}) : super(key: key);

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<CustomerListView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;

  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CustomerViewModel>(context, listen: false)
          .fetchCustomerList();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          Provider.of<CustomerViewModel>(context, listen: false).loadMoreData();
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final viewModel = context.watch<CustomerViewModel>();
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
      final viewModel = Provider.of<CustomerViewModel>(context, listen: false);
      viewModel.search = value;
      viewModel.fetchCustomerList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CustomerViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: isSearchClicked
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
                "Danh sách khách hàng",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isSearchClicked ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearchClicked = !isSearchClicked;
                if (!isSearchClicked) {
                  _searchController.clear();
                  viewModel.search = "";
                  viewModel.fetchCustomerList();
                }
              });
            },
          ),
        ],
      ),
      body: Consumer<CustomerViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: viewModel.customerList.length,
                  itemBuilder: (context, index) {
                    final customer = viewModel.customerList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle onPressed event here
                          print('Customer ${customer.customer_name} pressed');
                          Navigator.of(context).pop(customer);
                        },
                        child: CompanyItem(mCustomer: customer),
                      ),
                    );
                  },
                ),
              ),
              // if (viewModel.isLoading)
              //   const Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: CircularProgressIndicator(),
              //   ),
            ],
          );
        },
      ),
    );
  }
}

class CompanyItem extends StatelessWidget {
  final MCustomer mCustomer;
  const CompanyItem({Key? key, required this.mCustomer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Biểu tượng công ty + Mã công ty
          Column(
            children: [
              const Icon(Icons.home, size: 32, color: Colors.black),
              const SizedBox(height: 4),
              Text(
                mCustomer.customer_code ?? "",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(width: 12),

          /// Thông tin công ty
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mCustomer.customer_name ?? "",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16, color: Colors.black),
                    const SizedBox(width: 4),
                    Text(mCustomer.customer_phone ?? ""),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on,
                        size: 16, color: Colors.black),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        mCustomer.customer_addr ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

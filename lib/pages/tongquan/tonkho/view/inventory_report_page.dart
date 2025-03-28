import 'package:bividpharma/pages/tongquan/tonkho/compoments/category_grid.dart';
import 'package:bividpharma/pages/tongquan/tonkho/compoments/filter_sheet.dart';
import 'package:bividpharma/pages/tongquan/tonkho/compoments/inventory_chart.dart';
import 'package:bividpharma/pages/tongquan/tonkho/compoments/starts_cart.dart';
import 'package:bividpharma/pages/tongquan/tonkho/viewmodel/inventory_viewmodel.dart';
import 'package:bividpharma/ui/widgets/charts/legend_item.dart';
import 'package:bividpharma/utils/extensions/date_time_extension.dart';
import 'package:bividpharma/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryReportView extends StatelessWidget {
  const InventoryReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InventoryViewmodel()),
      ],
      child: const InventoryReportPage(),
    );
  }
}

class InventoryReportPage extends StatefulWidget {
  const InventoryReportPage({Key? key}) : super(key: key);

  @override
  State<InventoryReportPage> createState() => _InventoryReportPageState();
}

class _InventoryReportPageState extends State<InventoryReportPage> {
  @override
  Widget build(BuildContext context) {
    return const InventoryReportContent();
  }
}

class InventoryReportContent extends StatefulWidget {
  const InventoryReportContent({Key? key}) : super(key: key);

  @override
  State<InventoryReportContent> createState() => _InventoryReportContentState();
}

class _InventoryReportContentState extends State<InventoryReportContent> {
  void showFilterBottomSheet(BuildContext context) {
    final viewmodel = Provider.of<InventoryViewmodel>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Quan trọng để cho phép mở rộng chiều cao
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9, // Chiều cao ban đầu (90% màn hình)
          minChildSize: 0.5, // Chiều cao tối thiểu
          maxChildSize: 1.0, // Chiều cao tối đa (100% màn hình)
          expand: false, // Giúp tránh chiếm toàn bộ màn hình ngay lập tức
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: FilterBottomSheet(
                context: context,
                selectedCompany: viewmodel.selectedCompany,
                listCompany: viewmodel.listCompany,
                onFilterApplied: (startDate, endDate, maCty, maVatTu) {
                  print("Ngày bắt đầu: $startDate");
                  print("Ngày kết thúc: $endDate");
                  viewmodel.selectedCompany = maCty;
                  viewmodel.setFromDate(startDate.toFormattedString() ?? "");
                  viewmodel.setToDate(endDate.toFormattedString() ?? "");
                  viewmodel.filterData();
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InventoryViewmodel>(context, listen: false).fetchInventory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tổng quan tồn kho",
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
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<InventoryViewmodel>();
    return Consumer<InventoryViewmodel>(builder: (context, vm, child) {
      return Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tổng quan',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 400, // Provide a fixed height
                  child: GridView.count(
                    crossAxisCount: 2, // 2 cột
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.5, // Căn chỉnh kích thước
                    physics:
                        const NeverScrollableScrollPhysics(), // Không scroll vì dùng PageView
                    children: [
                      StatsCard(
                          icon: Icons.trending_up,
                          value: ((vm.summaryReport?['so_luong'] as num?)
                                      ?.toDouble() ??
                                  0.0)
                              .toShortMoneyFormat(),
                          label: "TỔNG SỐ LƯỢNG"),
                      StatsCard(
                          icon: Icons.trending_up,
                          value: ((vm.summaryReport?['tien'] as num?)
                                      ?.toDouble() ??
                                  0.0)
                              .toShortMoneyFormat(),
                          label: "TỔNG GIÁ TRỊ"),
                      StatsCard(
                          icon: Icons.trending_up,
                          value: ((vm.summaryReport?['so_luong_bv'] as num?)
                                      ?.toDouble() ??
                                  0.0)
                              .toShortMoneyFormat(),
                          label: "SỐ LƯỢNG BIVID"),
                      StatsCard(
                          icon: Icons.trending_up,
                          value: ((vm.summaryReport?['tien_bv'] as num?)
                                      ?.toDouble() ??
                                  0.0)
                              .toShortMoneyFormat(),
                          label: "GIÁ TRỊ BIVID"),
                      StatsCard(
                          icon: Icons.trending_up,
                          value: ((vm.summaryReport?['so_luong_ut'] as num?)
                                      ?.toDouble() ??
                                  0.0)
                              .toShortMoneyFormat(),
                          label: "SỐ LƯỢNG UỶ THÁC"),
                      StatsCard(
                          icon: Icons.trending_up,
                          value: ((vm.summaryReport?['tien_ut'] as num?)
                                      ?.toDouble() ??
                                  0.0)
                              .toShortMoneyFormat(),
                          label: "GIÁ TRỊ UỶ THÁC"),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 280,
              //   child: PageView(
              //     controller: _pageController,
              //     children: [
              //       const StatsPage(),
              //       const StatsPage(),
              //       const StatsPage(),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 8),
              // SmoothPageIndicator(
              //   controller: _pageController,
              //   count: 3, // Số trang
              //   effect: const WormEffect(
              //     dotHeight: 10,
              //     dotWidth: 10,
              //     activeDotColor: Colors.black,
              //     dotColor: Colors.grey,
              //   ),
              // ),
              ChartHeader(
                onChanged: (selected) {
                  print("Selected: $selected"); // Gọi API hoặc cập nhật UI
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    InventoryChart(
                      numberOfDays: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LegendItem(
                            color: Color.fromARGB(255, 11, 119, 187),
                            text: "Tiền tồn"),
                        SizedBox(width: 8),
                        LegendItem(
                            color: Color.fromARGB(255, 196, 59, 59),
                            text: "Tiền nhập"),
                        SizedBox(width: 8),
                        LegendItem(
                            color: Color.fromARGB(255, 219, 138, 23),
                            text: "Tiền xuất"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 30,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tồn kho theo',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const OptionsGrid(),
            ],
          ),
        ),
        if (viewModel.isLoading) // Hiển thị loading overlay
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(child: CircularProgressIndicator()),
          ),
      ]);
    });
  }
}

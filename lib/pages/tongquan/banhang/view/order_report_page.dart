import 'package:bividpharma/pages/tongquan/banhang/viewmodel/order_report_viewmodel.dart';
import 'package:bividpharma/pages/tongquan/thau/compoments/bidding_summay_card.dart';
import 'package:bividpharma/pages/tongquan/tonkho/compoments/starts_cart.dart';
import 'package:bividpharma/ui/widgets/cards/summary_card.dart';
import 'package:bividpharma/ui/widgets/charts/bar_chart.dart';
import 'package:bividpharma/ui/widgets/charts/pie_chart.dart';
import 'package:bividpharma/ui/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../ui/widgets/charts/line2_chart.dart';
import '../../thau/compoments/bidding_chart.dart';
import '../compoments/order_option_grid.dart';

class OrderReportView extends StatelessWidget {
  const OrderReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderReportViewmodel()),
      ],
      child: const OrderReportPage(),
    );
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
      body: const DashboardBanHangScreen(),
    );
  }
}

class DashboardBanHangScreen extends StatefulWidget {
  const DashboardBanHangScreen({Key? key}) : super(key: key);

  @override
  _DashboardBanHangScreen createState() => _DashboardBanHangScreen();
}

class _DashboardBanHangScreen extends State<DashboardBanHangScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderReportViewmodel>(context, listen: false).fetchReport();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OrderReportViewmodel>();
    return Consumer<OrderReportViewmodel>(builder: (context, vm, child) {
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
              SizedBox(
                height: 280,
                child: PageView(
                  controller: _pageController,
                  children: [
                    const StatsPage(),
                    const BiddingSummayGroup(),
                    const BiddingSummayGroup2(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3, // Số trang
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                ),
              ),
              // ChartHeader(
              //   onChanged: (selected) {
              //     print("Selected: $selected"); // Gọi API hoặc cập nhật UI
              //   },
              // ),
              const SizedBox(height: 16),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  SummaryCard(),
                  SummaryCard(),
                  SummaryCard(),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(8),
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
                child: const RevenueChart(),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(8),
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
                child: const LineChart3Sample(),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(8),
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
                child: const OverviewPieChart(),
              ),

              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(8),
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
                child: const BarChartSample(),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 30,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Báo cáo doanh số ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const OrderOptionGrid(),
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

import 'package:bividpharma/pages/tongquan/thau/compoments/bidding_options.dart';
import 'package:bividpharma/pages/tongquan/thau/compoments/bidding_summay_card.dart';
import 'package:bividpharma/pages/tongquan/thau/viewmodel/bidding_report_viewmodel.dart';
import 'package:bividpharma/pages/tongquan/tonkho/compoments/filter_sheet.dart';
import 'package:bividpharma/ui/widgets/navigation_bar.dart';
import 'package:bividpharma/utils/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../compoments/bidding_bar_chart.dart';

class BiddingReportView extends StatelessWidget {
  const BiddingReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BiddingReportViewmodel()),
      ],
      child: const BiddingReportPage(),
    );
  }
}

class BiddingReportPage extends StatefulWidget {
  const BiddingReportPage({Key? key}) : super(key: key);

  @override
  State<BiddingReportPage> createState() => _BiddingReportPageState();
}

class _BiddingReportPageState extends State<BiddingReportPage> {
  void showFilterBottomSheet(BuildContext context) {
    final viewmodel =
        Provider.of<BiddingReportViewmodel>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 1.0, // Chiều cao full màn hình
          child: FilterBottomSheet(
            context: context,
            selectedCompany: viewmodel.selectedCompany,
            listCompany: viewmodel.listCompany,
            onFilterApplied: (startDate, endDate, maCty, maVattu) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarInline(
        title: "Tổng quan thầu",
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Xử lý khi bấm vào icon
              showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: const DashboardSBiddingcreen(),
    );
  }
}

class DashboardSBiddingcreen extends StatefulWidget {
  const DashboardSBiddingcreen({Key? key}) : super(key: key);

  @override
  _DashboardSBiddingcreen createState() => _DashboardSBiddingcreen();
}

class _DashboardSBiddingcreen extends State<DashboardSBiddingcreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BiddingReportViewmodel>(context, listen: false).fetchReport();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BiddingReportViewmodel>();
    return Consumer<BiddingReportViewmodel>(builder: (context, vm, child) {
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
                    const SummaryPage1(),
                    const SummaryPage2(),
                    const SummaryPage3(),
                    const SummaryPage4(),
                    const SummaryPage5(),
                    const SummaryPage6(),
                    const SummaryPage7(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SmoothPageIndicator(
                controller: _pageController,
                count: 7, // Số trang
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
              // const SizedBox(height: 16),
              // const Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   spacing: 16,
              //   children: [
              //     SummaryCard(),
              //     SummaryCard(),
              //     SummaryCard(),
              //   ],
              // ),
              // const SizedBox(height: 16),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 16),
              //   padding: const EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(8),
              //     boxShadow: [
              //       const BoxShadow(
              //         color: Colors.black26,
              //         blurRadius: 4,
              //         offset: Offset(0, 1),
              //       ),
              //     ],
              //   ),
              //   child: const RevenueChart(),
              // ),
              // const SizedBox(height: 16),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 16),
              //   padding: const EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(8),
              //     boxShadow: [
              //       const BoxShadow(
              //         color: Colors.black26,
              //         blurRadius: 4,
              //         offset: Offset(0, 1),
              //       ),
              //     ],
              //   ),
              //   child: const LineChart3Sample(),
              // ),
              // const SizedBox(height: 16),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 16),
              //   padding: const EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(8),
              //     boxShadow: [
              //       const BoxShadow(
              //         color: Colors.black26,
              //         blurRadius: 4,
              //         offset: Offset(0, 1),
              //       ),
              //     ],
              //   ),
              //   child: const OverviewPieChart(),
              // ),

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
                child: const BiddingBarChart(),
              ),

              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 30,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Báo cáo thầu theo',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const BiddingOptionsGrid(),
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

import 'package:bividpharma/pages/tongquan/loinhuan/compoments/loinhuan_options.dart';
import 'package:bividpharma/pages/tongquan/loinhuan/viewmodel/loinhuan_view_model.dart';
import 'package:bividpharma/pages/tongquan/thau/compoments/bidding_summay_card.dart';
import 'package:bividpharma/ui/widgets/charts/bar_chart.dart';
import 'package:bividpharma/ui/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoinhuanPage extends StatelessWidget {
  const LoinhuanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoiNhuanViewModel()),
      ],
      child: const LoiNhuanReportContent(),
    );
  }
}

class LoiNhuanReportContent extends StatefulWidget {
  const LoiNhuanReportContent({Key? key}) : super(key: key);

  @override
  State<LoiNhuanReportContent> createState() => _LoiNhuanReportContentState();
}

class _LoiNhuanReportContentState extends State<LoiNhuanReportContent> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavigationBarInline(
          title: "Tổng Quan Lợi Nhuận",
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<LoiNhuanViewModel>(builder: (context, vm, child) {
          return Stack(children: [
            SingleChildScrollView(
                child: Column(children: [
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
                    const BiddingSummaryGroup2(),
                    const BiddingSummaryGroup2(),
                    const BiddingSummaryGroup2(),
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
                      'Báo cáo thầu theo',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const LoiNhuanOptionsGrid(),
            ]))
          ]);
        }));
  }
}

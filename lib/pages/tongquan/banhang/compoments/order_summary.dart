import 'package:bividpharma/pages/tongquan/banhang/viewmodel/order_report_viewmodel.dart';
import 'package:bividpharma/ui/widgets/cards/summary_card_1.dart';
import 'package:bividpharma/ui/widgets/cards/summary_card_2.dart';
import 'package:bividpharma/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSummary1 extends StatelessWidget {
  const OrderSummary1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderReportViewmodel>(
      builder: (context, vm, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.count(
            crossAxisCount: 2, // 2 cột
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5, // Căn chỉnh kích thước
            physics:
                const NeverScrollableScrollPhysics(), // Không scroll vì dùng PageView
            children: [
              SummaryCard1(
                  icon: Icons.bar_chart,
                  value: (vm.listSummary.first.keHoachNamNay ?? 0)
                      .toShortMoneyFormat(),
                  label: "Kế hoạch năm nay"),
              SummaryCard1(
                  icon: Icons.trending_up,
                  value: (vm.listSummary.first.slNamNay ?? 0).formatNumber(),
                  label: "SL năm nay"),
              SummaryCard1(
                  icon: Icons.bar_chart,
                  value:
                      (vm.listSummary.first.slNamNay ?? 0).toShortMoneyFormat(),
                  label: "DS năm nay"),
              SummaryCard2(
                  icon: Icons.trending_up,
                  value: "",
                  percent: (vm.listSummary.first.tlDat ?? 0) - 100,
                  label: "Tỉ lệ đạt được"),
            ],
          ),
        );
      },
    );
  }
}

class OrderSummary2 extends StatelessWidget {
  const OrderSummary2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderReportViewmodel>(builder: (context, vm, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 cột
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5, // Căn chỉnh kích thước
          physics:
              const NeverScrollableScrollPhysics(), // Không scroll vì dùng PageView
          children: [
            SummaryCard1(
                icon: Icons.bar_chart,
                value: (vm.listSummary.first.slCungKy ?? 0).formatNumber(),
                label: "SL cùng kỳ"),
            SummaryCard1(
                icon: Icons.trending_up,
                value:
                    (vm.listSummary.first.dsCungKy ?? 0).toShortMoneyFormat(),
                label: "DS cùng kỳ"),
            SummaryCard2(
                icon: Icons.bar_chart,
                value: "35K",
                percent: (vm.listSummary.first.ttCungKy ?? 0) - 100,
                label: "TT cùng kỳ"),
            SummaryCard1(
                icon: Icons.trending_up,
                value: (vm.listSummary.first.slTangTien ?? 0).formatNumber(),
                label: "SL Tặng & Kiểm nghiệm"),
          ],
        ),
      );
    });
  }
}

class OrderSummary3 extends StatelessWidget {
  const OrderSummary3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderReportViewmodel>(builder: (context, vm, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 cột
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5, // Căn chỉnh kích thước
          physics:
              const NeverScrollableScrollPhysics(), // Không scroll vì dùng PageView
          children: [
            SummaryCard1(
                icon: Icons.bar_chart,
                value: (vm.listSummary.first.tienTangKiemNghiem ?? 0)
                    .toShortMoneyFormat(),
                label: "Tiền Tặng & Kiểm nghiệm"),
            SummaryCard1(
                icon: Icons.trending_up,
                value:
                    (vm.listSummary.first.dsNamTruoc ?? 0).toShortMoneyFormat(),
                label: "DS năm trước"),
            SummaryCard1(
                icon: Icons.bar_chart,
                value: (vm.listSummary.first.slNamTruoc ?? 0).formatNumber(),
                label: "SL năm trước"),
            SummaryCard2(
                icon: Icons.trending_up,
                percent: (vm.listSummary.first.tangTruong ?? 0) - 100,
                value: "2,153",
                label: "Tăng trưởng"),
          ],
        ),
      );
    });
  }
}

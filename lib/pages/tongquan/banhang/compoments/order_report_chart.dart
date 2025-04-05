import 'package:bividpharma/model/dtos/reports/banhang/m_bh_report.dart';
import 'package:bividpharma/pages/tongquan/banhang/viewmodel/order_report_viewmodel.dart';
import 'package:bividpharma/ui/widgets/charts/legend_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LineChart3OrderReport extends StatelessWidget {
  const LineChart3OrderReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Acquisition Channels",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 250,
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const labels = [' Jan', 'Nov', ' Sep', ' Jul', ' May'];
                      return Text(labels[value.toInt()],
                          style: const TextStyle(fontSize: 12));
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: true),
              lineBarsData: [
                // Đường màu cam
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 40),
                    const FlSpot(1, 30),
                    const FlSpot(2, 25),
                    const FlSpot(3, 28),
                    const FlSpot(4, 35),
                  ],
                  isCurved: true,
                  color: Colors.orange,
                  barWidth: 3,
                ),
                // Đường màu xanh dương
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 25),
                    const FlSpot(1, 20),
                    const FlSpot(2, 32),
                    const FlSpot(3, 30),
                    const FlSpot(4, 37),
                  ],
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 3,
                ),
                // Đường màu xanh lá
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 30),
                    const FlSpot(1, 28),
                    const FlSpot(2, 27),
                    const FlSpot(3, 29),
                    const FlSpot(4, 34),
                  ],
                  isCurved: true,
                  color: Colors.green,
                  barWidth: 3,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(color: Colors.orange, text: "Kế hoạch năm nay"),
              SizedBox(width: 10),
              LegendItem(color: Colors.blue, text: "Doanh số năm nay"),
              SizedBox(width: 10),
              LegendItem(color: Colors.green, text: "Doanh số năm trước"),
            ],
          ),
        ),
      ],
    );
  }
}

class BarChartOrderReport extends StatelessWidget {
  const BarChartOrderReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderReportViewmodel>(builder: (context, vm, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Biểu đồ doanh số",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                maxWidth: 1500,
                minHeight: 250,
                maxHeight: 250,
              ),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: _getMaxY(vm.listChart),
                  barGroups: _generateBarGroups(vm.listChart),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: true, reservedSize: 0)),
                    leftTitles: const AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 80),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 80),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return Text(
                                vm.listChart[value.toInt()].kyPhanTich ?? "",
                                style: const TextStyle(fontSize: 10));
                          },
                          reservedSize: 30),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  groupsSpace: 12, // Khoảng cách giữa các nhóm cột
                  gridData: const FlGridData(show: true),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LegendItem(color: Colors.lightBlue, text: "Kế hoạch năm nay"),
                SizedBox(width: 10),
                LegendItem(color: Colors.blue, text: "Doanh số năm nay"),
                SizedBox(width: 10),
                LegendItem(color: Colors.indigo, text: "Doanh số năm trước"),
              ],
            ),
          ),
        ],
      );
    });
  }

  double _getMaxY(List<MBHReport> listChartData) {
    if (listChartData.isEmpty) return 1.0;

    final maxValue = listChartData
        .map((e) => [
              e.keHoachNamNay ?? 0,
              e.dsNamNay ?? 0,
              e.dsNamTruoc ?? 0,
            ])
        .expand((x) => x)
        .reduce((a, b) => a > b ? a : b);

    // Đảm bảo maxY chia hết cho 4
    double adjustedMaxY = ((maxValue * 1.5) / 4).ceilToDouble() * 4;
    return adjustedMaxY;
  }

  List<BarChartGroupData> _generateBarGroups(List<MBHReport> list) {
    return List.generate(list.length, (index) {
      final item = list[index];
      return makeGroupData(
        index,
        item.keHoachNamNay ?? 0,
        item.dsNamNay ?? 0,
        item.dsNamTruoc ?? 0,
      );
    });
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          toY: y1,
          color: Colors.lightBlue,
          width: 30,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y2,
          color: Colors.blue,
          width: 30,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y3,
          color: Colors.indigo,
          width: 30,
          borderRadius: BorderRadius.zero),
    ]);
  }
}

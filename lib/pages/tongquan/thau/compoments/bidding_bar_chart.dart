import 'package:bividpharma/model/dtos/reports/thau/m_thau_chart.dart';
import 'package:bividpharma/pages/tongquan/thau/viewmodel/bidding_report_viewmodel.dart';
import 'package:bividpharma/ui/widgets/charts/legend_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BiddingBarChart extends StatefulWidget {
  const BiddingBarChart({Key? key}) : super(key: key);

  @override
  _BiddingBarChartState createState() => _BiddingBarChartState();
}

class _BiddingBarChartState extends State<BiddingBarChart> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BiddingReportViewmodel>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Biểu đồ theo tháng",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              maxWidth: 1200,
              minHeight: 250,
              maxHeight: 250,
            ),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: _getMaxY(viewModel.listChartData ?? []),
                barGroups: _generateBarGroups(viewModel.listChartData ?? []),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 0)),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 80),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 80),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return Text(
                            viewModel.listChartData?[value.toInt()].thang ?? "",
                            style: const TextStyle(fontSize: 12));
                      },
                    ),
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
        const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LegendItem(
                    color: Color.fromARGB(255, 5, 100, 140),
                    text: "Giá trị mời thầu"),
                SizedBox(width: 10),
                LegendItem(
                    color: Color.fromARGB(255, 136, 72, 9),
                    text: "Giá trị trúng thầu"),
                SizedBox(width: 10),
                LegendItem(
                    color: Color.fromARGB(255, 191, 165, 19),
                    text: "Giá trị thầu"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                LegendItem(
                    color: Color.fromARGB(255, 231, 88, 6),
                    text: "Gía trị thực hiện"),
                SizedBox(width: 10),
                LegendItem(
                    color: Color.fromARGB(255, 68, 129, 7),
                    text: "Giá trị tồn thầu"),
                SizedBox(width: 10),
                LegendItem(
                    color: Color.fromARGB(255, 89, 25, 167),
                    text: "Giá trị bỏ thầu"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  double _getMaxY(List<MThauChart> listChartData) {
    if (listChartData.isEmpty) return 1.0;

    final maxValue = listChartData
        .map((e) => [
              e.moiThau ?? 0,
              e.trungThau ?? 0,
              e.giaTriThau ?? 0,
              e.giaTriThucHien ?? 0,
              e.giaTriTonThau ?? 0,
              e.tienBoThau ?? 0,
            ])
        .expand((x) => x)
        .reduce((a, b) => a > b ? a : b);

    // Đảm bảo maxY chia hết cho 4
    double adjustedMaxY = ((maxValue * 1.5) / 4).ceilToDouble() * 4;

    print("Max Value: $maxValue, Adjusted MaxY: $adjustedMaxY");
    return adjustedMaxY;
  }

  List<BarChartGroupData> _generateBarGroups(List<MThauChart> list) {
    return List.generate(list.length, (index) {
      final item = list[index];
      return makeGroupData(
        index,
        item.moiThau ?? 0,
        item.trungThau ?? 0,
        item.giaTriThau ?? 0,
        item.giaTriThucHien ?? 0,
        item.giaTriTonThau ?? 0,
        item.tienBoThau ?? 0,
      );
    });
  }

  BarChartGroupData makeGroupData(
    int x,
    double y1,
    double y2,
    double y3,
    double y4,
    double y5,
    double y6,
  ) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          toY: y1,
          color: const Color.fromARGB(255, 5, 100, 140),
          width: 10,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y2,
          color: const Color.fromARGB(255, 136, 72, 9),
          width: 10,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y3,
          color: const Color.fromARGB(255, 191, 165, 19),
          width: 10,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y4,
          color: const Color.fromARGB(255, 231, 88, 6),
          width: 10,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y5,
          color: const Color.fromARGB(255, 68, 129, 7),
          width: 10,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y6,
          color: const Color.fromARGB(255, 89, 25, 167),
          width: 10,
          borderRadius: BorderRadius.zero),
    ]);
  }
}

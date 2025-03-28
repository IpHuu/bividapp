import 'package:bividpharma/ui/widgets/charts/legend_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample extends StatelessWidget {
  const BarChartSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Quarterly Revenue by Country",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 250,
          child: BarChart(
            BarChartData(
              barGroups: [
                makeGroupData(0, 4000, 4200, 4500), // Q1
                makeGroupData(1, 5200, 4800, 4600), // Q2
                makeGroupData(2, 7300, 5900, 5100), // Q3
                makeGroupData(3, 7000, 5600, 5300), // Q4
              ],
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const labels = ['Q1', 'Q2', 'Q3', 'Q4'];
                      return Text(labels[value.toInt()],
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
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LegendItem(color: Colors.lightBlue, text: "United States"),
            SizedBox(width: 10),
            LegendItem(color: Colors.blue, text: "United Kingdom"),
            SizedBox(width: 10),
            LegendItem(color: Colors.indigo, text: "India"),
          ],
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          toY: y1,
          color: Colors.lightBlue,
          width: 10,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y2,
          color: Colors.blue,
          width: 10,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          toY: y3,
          color: Colors.indigo,
          width: 10,
          borderRadius: BorderRadius.zero),
    ]);
  }
}

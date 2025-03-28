import 'package:bividpharma/ui/widgets/charts/legend_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChart3Sample extends StatelessWidget {
  const LineChart3Sample({
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LegendItem(color: Colors.orange, text: "Năm nay"),
            SizedBox(width: 10),
            LegendItem(color: Colors.blue, text: "Năm trước"),
            SizedBox(width: 10),
            LegendItem(color: Colors.green, text: "India"),
          ],
        ),
      ],
    );
  }
}

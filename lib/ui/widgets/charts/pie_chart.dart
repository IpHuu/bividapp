import 'package:bividpharma/ui/widgets/charts/legend_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OverviewPieChart extends StatelessWidget {
  const OverviewPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Overview Product",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 220,
              width: 220,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 50,
                      color: Colors.orange,
                      title: '50%',
                      radius: 80,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    PieChartSectionData(
                      value: 35,
                      color: Colors.teal,
                      title: '35%',
                      radius: 80,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    PieChartSectionData(
                      value: 15,
                      color: Colors.red,
                      title: '15%',
                      radius: 80,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                  sectionsSpace: 2,
                  centerSpaceRadius: 20,
                ),
              ),
            ),
            const SizedBox(width: 20), // Khoảng cách giữa biểu đồ và ghi chú
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LegendItem(color: Colors.orange, text: "Product A"),
                SizedBox(width: 8),
                LegendItem(color: Colors.teal, text: "Product B"),
                SizedBox(width: 8),
                LegendItem(color: Colors.red, text: "Product C"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: LineChart(
          LineChartData(
            minY: 27000, // Đặt giới hạn dưới phù hợp
            maxY: 34000, // Đặt giới hạn trên phù hợp
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2000,
                  getTitlesWidget: (value, meta) {
                    if (value >= 1000) {
                      return Text(
                        '${(value / 1000).toStringAsFixed(0)}k', // Hiển thị số với 1 chữ số thập phân nếu cần
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      );
                    } else {
                      return Text(
                        '${value.toStringAsFixed(0)}k', // Hiển thị số bình thường nếu < 1000
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      );
                    }
                  },
                  reservedSize: 30,
                ),
              ),
              bottomTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            gridData: const FlGridData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 33000),
                  const FlSpot(1, 30500),
                  const FlSpot(2, 30300),
                  const FlSpot(3, 30600),
                  const FlSpot(4, 32800),
                  const FlSpot(5, 28500),
                  const FlSpot(6, 30200),
                  const FlSpot(7, 27500),
                  const FlSpot(8, 33000),
                ],
                isCurved: true,
                color: Colors.blue,
                dotData: const FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

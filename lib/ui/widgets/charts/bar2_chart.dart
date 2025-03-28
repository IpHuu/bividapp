import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WinLossChartDemo extends StatelessWidget {
  WinLossChartDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          barGroups: _generateBarGroups(), // Dữ liệu biểu đồ
          borderData: FlBorderData(show: false), // Ẩn viền
          gridData: const FlGridData(show: false), // Ẩn lưới
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)), // Ẩn trục Y
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)), // Ẩn trục phải
            topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)), // Ẩn tiêu đề trên
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: _bottomTitles, // Hiển thị số trận đấu
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🟢🔴 Danh sách dữ liệu thắng (1) hoặc thua (-1)
  List<int> winLossData = [1, -1, 1, 1, -1, 1, -1, -1, 1, 1];

  /// 📊 Tạo danh sách Bar Chart
  List<BarChartGroupData> _generateBarGroups() {
    return List.generate(winLossData.length, (index) {
      return BarChartGroupData(
        x: index, // Giá trị trên trục X
        barRods: [
          BarChartRodData(
            toY: winLossData[index].toDouble(), // Giá trị trục Y
            color: winLossData[index] > 0
                ? Colors.green
                : Colors.red, // Xanh: thắng, Đỏ: thua
            width: 20, // Độ rộng của cột
            borderRadius: BorderRadius.circular(5), // Bo góc
          ),
        ],
      );
    });
  }

  /// 📌 Hiển thị số trận đấu dưới trục X
  Widget _bottomTitles(double value, TitleMeta meta) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text("Game ${value.toInt() + 1}",
          style: const TextStyle(fontSize: 12)),
    );
  }
}

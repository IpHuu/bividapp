import 'dart:math';

import 'package:bividpharma/model/dtos/tonkho/m_inventory_chart.dart';
import 'package:bividpharma/pages/tongquan/tonkho/viewmodel/inventory_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryChart extends StatefulWidget {
  final int numberOfDays;

  const InventoryChart({Key? key, this.numberOfDays = 30}) : super(key: key);

  @override
  _InventoryChartState createState() => _InventoryChartState();
}

class _InventoryChartState extends State<InventoryChart> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<InventoryViewmodel>();
    final listChartData = viewModel.listChartData ?? [];
    final interval = _getMaxY(listChartData) / 3;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: max(MediaQuery.of(context).size.width,
            listChartData.length * 100), // Tăng kích thước theo số ngày
        height: 300,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: _getMaxY(listChartData), // Xác định maxY
            barGroups: _generateBarGroups(listChartData),
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      listChartData[value.toInt()].thang, // Hiển thị tháng
                      style: const TextStyle(fontSize: 10),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }

  /// 🔹 Xác định giá trị lớn nhất của biểu đồ để maxY hiển thị hợp lý
  double _getMaxY(List<MInventoryChart> listChartData) {
    if (listChartData.isEmpty) return 1.0;

    final maxValue = listChartData
        .map((e) => [e.tien ?? 0, e.tien_nhap ?? 0, e.tien_xuat ?? 0])
        .expand((x) => x)
        .reduce((a, b) => a > b ? a : b);

    // Đảm bảo maxY chia hết cho 4
    double adjustedMaxY = ((maxValue * 1.5) / 4).ceilToDouble() * 4;

    print("Max Value: $maxValue, Adjusted MaxY: $adjustedMaxY");
    return adjustedMaxY;
  }

  /// 🔹 Chuyển đổi `List<MInventoryChart>` thành `List<BarChartGroupData>`
  List<BarChartGroupData> _generateBarGroups(
      List<MInventoryChart> listChartData) {
    return List.generate(listChartData.length, (index) {
      final item = listChartData[index];
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
              toY: item.tien ?? 0,
              color: const Color.fromARGB(255, 11, 119, 187),
              width: 20,
              borderRadius: BorderRadius.zero),
          BarChartRodData(
              toY: item.tien_nhap ?? 0,
              color: const Color.fromARGB(255, 196, 59, 59),
              width: 20,
              borderRadius: BorderRadius.zero),
          BarChartRodData(
              toY: item.tien_xuat ?? 0,
              color: const Color.fromARGB(255, 219, 138, 23),
              width: 20,
              borderRadius: BorderRadius.zero)
        ],
      );
    });
  }
}

class ChartHeader extends StatefulWidget {
  final Function(String) onChanged;

  const ChartHeader({Key? key, required this.onChanged}) : super(key: key);

  @override
  _OrdersHeaderState createState() => _OrdersHeaderState();
}

class _OrdersHeaderState extends State<ChartHeader> {
  String selectedOption = 'Week'; // Giá trị mặc định

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Biểu đồ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          // Container(
          //   height: 32,
          //   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.black),
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: DropdownButtonHideUnderline(
          //     child: DropdownButton<String>(
          //       value: selectedOption,
          //       icon: const Icon(Icons.arrow_drop_down),
          //       style: const TextStyle(fontSize: 16, color: Colors.black),
          //       items: ['Week', 'Month', 'Year']
          //           .map((option) => DropdownMenuItem(
          //                 value: option,
          //                 child: Text(option),
          //               ))
          //           .toList(),
          //       onChanged: (value) {
          //         if (value != null) {
          //           setState(() {
          //             selectedOption = value;
          //           });
          //           widget.onChanged(value);
          //         }
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

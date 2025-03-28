import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class HorizontalTableDemo extends StatefulWidget {
  const HorizontalTableDemo({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalTableDemo> createState() => _HorizontalTableDemoState();
}

class _HorizontalTableDemoState extends State<HorizontalTableDemo> {
  final int rowCount = 10; // Số hàng dữ liệu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Horizontal Data Table")),
      body: HorizontalDataTable(
        leftHandSideColumnWidth: 80, // Cột cố định (ID)
        rightHandSideColumnWidth: 500, // Chiều rộng của bảng cuộn ngang
        isFixedHeader: true, // Giữ tiêu đề cố định
        headerWidgets: _buildHeader(), // Tiêu đề
        leftSideItemBuilder: _buildLeftColumn, // Cột cố định (ID)
        rightSideItemBuilder: _buildRightColumns, // Các cột cuộn ngang
        itemCount: rowCount, // Tổng số hàng
        rowSeparatorWidget: const Divider(height: 1, color: Colors.grey),
        elevation: 5, // Đổ bóng
      ),
    );
  }

  // 📝 Tiêu đề bảng
  List<Widget> _buildHeader() {
    return [
      _headerCell("ID", 80),
      _headerCell("Name", 100),
      _headerCell("Age", 100),
      _headerCell("Position", 200),
      _headerCell("Salary", 100),
    ];
  }

  // 📝 Cột đầu tiên (ID) - Cố định
  Widget _buildLeftColumn(BuildContext context, int index) {
    return _dataCell("${index + 1}", 80);
  }

  // 📝 Các cột còn lại - Có thể cuộn ngang
  Widget _buildRightColumns(BuildContext context, int index) {
    int salary = 3000 + (index * 100);
    int change = (index % 2 == 0) ? 50 : -30; // Giá trị tăng hoặc giảm

    return Row(
      children: [
        _dataCell("User $index", 100),
        _dataCell("${20 + index}", 100),
        _dataCell("Developer", 200),
        _salaryCell(salary, change, 100),
      ],
    );
  }

  // 📌 Widget ô tiêu đề
  Widget _headerCell(String title, double width) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  // 📌 Widget ô dữ liệu thông thường
  Widget _dataCell(String text, double width) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  // 📌 Widget ô dữ liệu LƯƠNG có biểu tượng tăng/giảm
  Widget _salaryCell(int salary, int change, double width) {
    bool isIncrease = change >= 0;
    Color color = isIncrease ? Colors.green : Colors.red;
    IconData icon = isIncrease ? Icons.arrow_upward : Icons.arrow_downward;

    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("\$$salary", style: const TextStyle(fontSize: 16)),
          // const SizedBox(width: 8),
          Icon(icon, color: color, size: 18), // Icon mũi tên lên/xuống
          Text(
            "${isIncrease ? '+' : ''}$change", // Hiển thị dấu + nếu tăng
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:bividpharma/model/dtos/reports/tonghop/m_tong_hop.dart';
import 'package:bividpharma/ui/widgets/navigation_bar.dart';
import 'package:bividpharma/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:provider/provider.dart';

import '../viewmodel/tonghop_report_viewmodel.dart';

class TonghopReportView extends StatelessWidget {
  const TonghopReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TongHopReportViewModel()),
      ],
      child: const OrderReportPage(),
    );
  }
}

class OrderReportPage extends StatefulWidget {
  const OrderReportPage({Key? key}) : super(key: key);

  @override
  State<OrderReportPage> createState() => _OrderReportPageState();
}

class _OrderReportPageState extends State<OrderReportPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TongHopReportViewModel>(context, listen: false).fetchReport();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarInline(
        title: "Tổng Quan Tổng Hợp",
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Xử lý khi bấm vào icon
            },
          ),
        ],
      ),
      body: const HorizontalTable(),
    );
  }
}

class HorizontalTable extends StatefulWidget {
  const HorizontalTable({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalTable> createState() => _HorizontalTableState();
}

class _HorizontalTableState extends State<HorizontalTable> {
  final int rowCount = 10; // Số hàng dữ liệu

  @override
  Widget build(BuildContext context) {
    TongHopReportViewModel viewModel =
        Provider.of<TongHopReportViewModel>(context, listen: true);
    return HorizontalDataTable(
      leftHandSideColumnWidth: 200, // Cột cố định (ID)
      rightHandSideColumnWidth: 700, // Chiều rộng của bảng cuộn ngang
      isFixedHeader: true, // Giữ tiêu đề cố định
      headerWidgets: _buildHeader(), // Tiêu đề
      leftSideItemBuilder: (context, index) => _buildLeftColumn(
          context, index, viewModel.listTongHop ?? []), // Cột cố định (ID)
      rightSideItemBuilder: (context, index) => _buildRightColumns(
          context, index, viewModel.listTongHop ?? []), // Các cột cuộn ngang
      itemCount: viewModel.listTongHop?.length ?? 0, // Tổng số hàng
      rowSeparatorWidget: const Divider(height: 1, color: Colors.grey),
      elevation: 5, // Đổ bóng
    );
  }

  // 📝 Tiêu đề bảng
  List<Widget> _buildHeader() {
    return [
      _headerCell("Loại", 200),
      _headerCell("Humana", 100),
      _headerCell("Bivid", 100),
      _headerCell("BJ", 100),
      _headerCell("ARISTO", 100),
      _headerCell("Bảo Long", 100),
      _headerCell("Tổng cộng", 100),
      _headerCell("Tổng năm", 100),
    ];
  }

  // 📝 Cột đầu tiên (ID) - Cố định
  Widget _buildLeftColumn(
      BuildContext context, int index, List<MTongHop> data) {
    return _dataCell(data[index].loaiTongquan ?? "", 200);
  }

  // 📝 Các cột còn lại - Có thể cuộn ngang
  Widget _buildRightColumns(
      BuildContext context, int index, List<MTongHop> data) {
    return Row(children: [
      _dataCell(
          (data[index].tienHumana as num).toDouble().toShortMoneyFormat(), 100),
      _dataCell(
          (data[index].tienBivid as num).toDouble().toShortMoneyFormat(), 100),
      _dataCell(
          (data[index].tienBj as num).toDouble().toShortMoneyFormat(), 100),
      _dataCell(
          (data[index].tienAristo as num).toDouble().toShortMoneyFormat(), 100),
      _dataCell(
          (data[index].tienBaolong as num).toDouble().toShortMoneyFormat(),
          100),
      _dataCell(
          (data[index].tienTongCong as num).toDouble().toShortMoneyFormat(),
          100),
      _dataCell(
          (data[index].tienTongCongNam as num).toDouble().toShortMoneyFormat(),
          100),
    ]);
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
}

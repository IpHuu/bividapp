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
  bool showFilters = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarInline(
        title: "Tổng Quan Tổng Hợp",
        actions: [
          IconButton(
            icon: Icon(showFilters ? Icons.filter_alt_off : Icons.filter_alt),
            onPressed: () {
              // Thực hiện hành động khi nhấn nút
              setState(() {
                showFilters = !showFilters;
              });
            },
          ),
        ],
      ),
      body: HorizontalTable(showFilters: showFilters),
    );
  }
}

class HorizontalTable extends StatefulWidget {
  final bool showFilters;
  const HorizontalTable({Key? key, required this.showFilters})
      : super(key: key);

  @override
  State<HorizontalTable> createState() => _HorizontalTableState();
}

class _HorizontalTableState extends State<HorizontalTable> {
  int selectedYear1 = DateTime.now().year;
  int selectedYear2 = DateTime.now().year;
  int selectedYear3 = DateTime.now().year;
  void _search() {
    print(
        "🔍 Tìm kiếm với: Năm 1: $selectedYear1, Năm 2: $selectedYear2, Năm 3: $selectedYear3");
    final viewModel =
        Provider.of<TongHopReportViewModel>(context, listen: false);
    viewModel.fetchReport(
      nam: selectedYear1.toString(),
      tuNam: selectedYear2.toString(),
      denNam: selectedYear3.toString(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TongHopReportViewModel>(context, listen: false).fetchReport(
        nam: selectedYear1.toString(),
        tuNam: selectedYear2.toString(),
        denNam: selectedYear3.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    TongHopReportViewModel viewModel =
        Provider.of<TongHopReportViewModel>(context, listen: true);
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Visibility(
              visible: widget.showFilters,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 8,
                      children: [
                        Expanded(
                          child: YearDropdown(
                            inputYear: selectedYear1,
                            title: "Năm",
                            onYearChanged: (year) =>
                                setState(() => selectedYear1 = year),
                          ),
                        ),
                        Expanded(
                          child: YearDropdown(
                            inputYear: selectedYear2,
                            title: "Từ năm",
                            onYearChanged: (year) =>
                                setState(() => selectedYear2 = year),
                          ),
                        ),
                        Expanded(
                          child: YearDropdown(
                            inputYear: selectedYear3,
                            title: "Đến năm",
                            onYearChanged: (year) =>
                                setState(() => selectedYear3 = year),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _search,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Xem dữ liệu"),
                  ),
                ],
              )),
          Expanded(
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 200, // Cột cố định (ID)
              rightHandSideColumnWidth:
                  7 * 200, // Chiều rộng của bảng cuộn ngang
              isFixedHeader: true, // Giữ tiêu đề cố định
              headerWidgets: _buildHeader(), // Tiêu đề
              leftSideItemBuilder: (context, index) => _buildLeftColumn(context,
                  index, viewModel.listTongHop ?? []), // Cột cố định (ID)
              rightSideItemBuilder: (context, index) => _buildRightColumns(
                  context,
                  index,
                  viewModel.listTongHop ?? []), // Các cột cuộn ngang
              itemCount: viewModel.listTongHop?.length ?? 0, // Tổng số hàng
              rowSeparatorWidget: const Divider(height: 1, color: Colors.grey),
              elevation: 5, // Đổ bóng
            ),
          ),
        ],
      ),
      if (viewModel.isLoading) // Hiển thị loading overlay
        Container(
          color: Colors.black.withOpacity(0.5),
          child: const Center(child: CircularProgressIndicator()),
        ),
    ]);
  }

  // 📝 Tiêu đề bảng
  List<Widget> _buildHeader() {
    return [
      _headerCell("Loại", 200),
      _headerCell("Bileje", 200),
      _headerCell("Bivid", 200),
      _headerCell("Bivid's Healthcare Group", 200),
      _headerCell("B&J", 200),
      _headerCell("Bảo Long", 200),
      _headerCell("Tổng cộng", 200),
      _headerCell("Tổng nhiều năm", 200),
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
          (data[index].tienHumana as num).toDouble().formatCurrency(), 200),
      _dataCell(
          (data[index].tienBivid as num).toDouble().formatCurrency(), 200),
      _dataCell(
          (data[index].tienAristo as num).toDouble().formatCurrency(), 200),
      _dataCell((data[index].tienBj as num).toDouble().formatCurrency(), 200),
      _dataCell(
          (data[index].tienBaolong as num).toDouble().formatCurrency(), 200),
      _dataCell(
          (data[index].tienTongCong as num).toDouble().formatCurrency(), 200),
      _dataCell(
          (data[index].tienTongCongNam as num).toDouble().formatCurrency(),
          200),
    ]);
  }

  // 📌 Widget ô tiêu đề
  Widget _headerCell(String title, double width) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      color: Colors.blue,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // 📌 Widget ô dữ liệu thông thường
  Widget _dataCell(String text, double width) {
    return Container(
      width: width,
      height: 80,
      alignment: Alignment.center,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text, style: const TextStyle(fontSize: 16)),
          )),
    );
  }
}

class YearDropdown extends StatefulWidget {
  int? inputYear;
  final String title;
  final Function(int) onYearChanged;

  YearDropdown(
      {Key? key,
      required this.title,
      required this.onYearChanged,
      this.inputYear})
      : super(key: key);

  @override
  State<YearDropdown> createState() => _YearDropdownState();
}

class _YearDropdownState extends State<YearDropdown> {
  late int selectedYear;
  late List<int> years;

  @override
  void initState() {
    super.initState();
    int currentYear = DateTime.now().year;
    years = List.generate(currentYear - 2016 + 1, (index) => 2016 + index);
    if (widget.inputYear != null) {
      selectedYear = widget.inputYear!;
    } else {
      selectedYear = currentYear;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      width: 120, // Giới hạn chiều rộng dropdown
      label: Text(widget.title), // Sử dụng title truyền vào
      initialSelection: selectedYear,
      onSelected: (int? newYear) {
        if (newYear != null) {
          setState(() {
            selectedYear = newYear;
          });
          widget.onYearChanged(newYear); // Gửi giá trị năm ra ngoài
        }
      },
      dropdownMenuEntries: years
          .map((year) => DropdownMenuEntry(
                value: year,
                label: year.toString(),
              ))
          .toList(),
    );
  }
}

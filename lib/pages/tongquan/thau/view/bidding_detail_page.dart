import 'package:bividpharma/model/dtos/reports/thau/m_thau_report.dart';
import 'package:bividpharma/pages/tongquan/thau/viewmodel/bidding_report_viewmodel.dart';
import 'package:bividpharma/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:provider/provider.dart';

import '../../../../model/enums/type_thau.dart';

class BiddingDetailPage extends StatefulWidget {
  final TypeThau typeThau;
  const BiddingDetailPage({Key? key, required this.typeThau}) : super(key: key);

  @override
  State<BiddingDetailPage> createState() => _BiddingDetailPageState();
}

class _BiddingDetailPageState extends State<BiddingDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BiddingReportViewmodel>(context, listen: false)
          .fetchData(widget.typeThau);
    });
  }

  @override
  Widget build(BuildContext context) {
    BiddingReportViewmodel viewModel =
        Provider.of<BiddingReportViewmodel>(context, listen: true);
    double widthRight = 500;
    switch (widget.typeThau) {
      case TypeThau.chinhanh:
      case TypeThau.nhomkhachhang:
      case TypeThau.nhomsanpham:
      case TypeThau.khachhang:
      case TypeThau.sanpham:
        widthRight = 800;
        break;
      case TypeThau.nhanvien:
        widthRight = 400;
        break;
      case TypeThau.tonthau:
        widthRight = 1200;
        break;
      default:
        widthRight = 500;
    }
    double widthLeftColum = 100;
    switch (widget.typeThau) {
      case TypeThau.chinhanh:
      case TypeThau.nhomkhachhang:
        widthLeftColum = 100;
        break;
      case TypeThau.nhomsanpham:
      case TypeThau.nhanvien:
      case TypeThau.khachhang:
      case TypeThau.sanpham:
      case TypeThau.tonthau:
        widthLeftColum = 200;
        break;
      default:
        widthLeftColum = 100;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thầu theo ${widget.typeThau.name}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          HorizontalDataTable(
            leftHandSideColumnWidth: widthLeftColum, // Cột cố định (ID)
            rightHandSideColumnWidth:
                widthRight, // Chiều rộng của bảng cuộn ngang
            isFixedHeader: true, // Giữ tiêu đề cố định
            headerWidgets: _buildHeader(
              widget.typeThau,
              widthLeftColum,
            ), // Tiêu đề
            leftSideItemBuilder: (context, index) => _buildLeftColumn(
                context,
                index,
                viewModel.listThauData ?? [],
                widget.typeThau,
                widthLeftColum), // Cột cố định (ID)
            rightSideItemBuilder: (context, index) => _buildRightColumns(
                context,
                index,
                viewModel.listThauData ?? [],
                widget.typeThau), // Các cột cuộn ngang
            itemCount: viewModel.listThauData?.length ?? 0, // Tổng số hàng
            rowSeparatorWidget: const Divider(height: 1, color: Colors.grey),
            elevation: 5, // Đổ bóng
          ),
          if (viewModel.isLoading) // Hiển thị loading overlay
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  // 📝 Tiêu đề bảng
  List<Widget> _buildHeader(TypeThau type, double widthLeftColum) {
    switch (type) {
      case TypeThau.chinhanh:
      case TypeThau.nhomkhachhang:
      case TypeThau.nhomsanpham:
      case TypeThau.khachhang:
      case TypeThau.sanpham:
        return [
          _headerCell(type.name, widthLeftColum),
          _headerCell("GT Mời Thầu", 100),
          _headerCell("TLSL Trúng Thầu", 100),
          _headerCell("TLGT Trúng Thầu", 100),
          _headerCell("GT trúng thầu", 100),
          _headerCell("GT thầu", 100),
          _headerCell("GT thực hiện", 100),
          _headerCell("GT tồn thầu", 100),
          _headerCell("GT bỏ thầu", 100),
        ];
      case TypeThau.nhanvien:
        return [
          _headerCell(type.name, widthLeftColum),
          _headerCell("GT thầu", 100),
          _headerCell("GT thực hiện", 100),
          _headerCell("GT tồn thầu", 100),
          _headerCell("GT bỏ thầu", 100),
        ];
      case TypeThau.tonthau:
        return [
          _headerCell("Tên sản phẩm", widthLeftColum),
          _headerCell("Số tháng", 100),
          _headerCell("Ngày trúng thầu", 100),
          _headerCell("Ngày BĐ thầu", 100),
          _headerCell("Ngày KT thầu", 100),
          _headerCell("Tháng còn thầu", 100),
          _headerCell("SL thầu", 100),
          _headerCell("Tiền thầu", 100),
          _headerCell("Số tồn thầu", 100),
          _headerCell("Tiền tồn thầu", 100),
          _headerCell("Nhân viên", 100),
          _headerCell("Chi nhánh", 100),
          _headerCell("Khách hàng", 100),
        ];
      default:
        return [
          _headerCell("ID", 80),
          _headerCell("Name", 100),
          _headerCell("Age", 100),
          _headerCell("Position", 200),
          _headerCell("Salary", 100),
        ];
    }
  }

  // 📝 Cột đầu tiên (ID) - Cố định
  Widget _buildLeftColumn(BuildContext context, int index,
      List<MThauReport> data, TypeThau type, double widthLeftColum) {
    switch (type) {
      case TypeThau.chinhanh:
        return _dataHeaderCell("${data[index].tenChiNhanh}", widthLeftColum);
      case TypeThau.nhomkhachhang:
        return _dataHeaderCell("${data[index].tenNhKhachHang}", widthLeftColum);
      case TypeThau.nhomsanpham:
        return _dataHeaderCell("${data[index].tenNhVatTu}", widthLeftColum);
      case TypeThau.nhanvien:
        return _dataHeaderCell("${data[index].tenNhanVien}", widthLeftColum);
      case TypeThau.khachhang:
        return _dataHeaderCell("${data[index].tenKhachHang}", widthLeftColum);
      case TypeThau.sanpham:
        return _dataHeaderCell("${data[index].tenSanPham}", widthLeftColum);
      case TypeThau.tonthau:
        return _dataHeaderCell("${data[index].tenSanPham}", widthLeftColum);
      default:
        return _dataCell("${index + 1}", 80);
    }
  }

  // 📝 Các cột còn lại - Có thể cuộn ngang
  Widget _buildRightColumns(
      BuildContext context, int index, List<MThauReport> data, TypeThau type) {
    int salary = 3000 + (index * 100);
    int change = (index % 2 == 0) ? 50 : -30; // Giá trị tăng hoặc giảm

    switch (type) {
      case TypeThau.chinhanh:
      case TypeThau.nhomkhachhang:
      case TypeThau.nhomsanpham:
      case TypeThau.khachhang:
      case TypeThau.sanpham:
        return Row(
          children: [
            _dataCell(
                (data[index].giaTriMoiThau ?? 0.0).toShortMoneyFormat(), 100),
            _percentCell(data[index].tlslTrungThau ?? 0.0, 100),
            _percentCell(data[index].tlGiaTriTrungThau ?? 0.0, 100),
            _dataCell(
                (data[index].giaTriTrungThau ?? 0.0).toShortMoneyFormat(), 100),
            _dataCell(
                (data[index].giaTriThau ?? 0.0).toShortMoneyFormat(), 100),
            _dataCell(
                (data[index].giaTriThucHien ?? 0.0).toShortMoneyFormat(), 100),
            _dataCell(
                (data[index].giaTriTonThau ?? 0.0).toShortMoneyFormat(), 100),
            _dataCell(
                (data[index].giaTriTonThau1 ?? 0.0).toShortMoneyFormat(), 100),
          ],
        );
      case TypeThau.nhanvien:
        return Row(
          children: [
            _dataCell(
                (data[index].giaTriThau ?? 0.0).toShortMoneyFormat(), 100),
            _dataCell(
                (data[index].giaTriThucHien ?? 0.0).toShortMoneyFormat(), 100),
            _dataCell(
                (data[index].giaTriTonThau ?? 0.0).toShortMoneyFormat(), 100),
            _dataCell(
                (data[index].giaTriTonThau1 ?? 0.0).toShortMoneyFormat(), 100),
          ],
        );
      case TypeThau.tonthau:
        return Row(
          children: [
            _dataCell((data[index].thangConLai ?? 0).toString(), 100),
            _dataCell((data[index].ngayTrungThau ?? 0).toString(), 100),
            _dataCell(data[index].ngayThHd ?? "", 100),
            _dataCell(data[index].ngayKtHd ?? "", 100),
            _dataCell((data[index].thangConLai ?? 0).toString(), 100),
            _dataCell((data[index].slThau ?? 0).toString(), 100),
            _dataCell((data[index].tienThau ?? 0).toShortMoneyFormat(), 100),
            _dataCell((data[index].slTonThau ?? 0).toString(), 100),
            _dataCell((data[index].tienTonThau ?? 0).toShortMoneyFormat(), 100),
            _dataCell(data[index].tenNhanVien ?? "", 100),
            _dataCell(data[index].tenChiNhanh ?? "", 100),
            _dataCell(data[index].tenKhachHang ?? "", 100),
          ],
        );
      default:
        return Row(
          children: [
            _dataCell("User $index", 100),
            _dataCell("${20 + index}", 100),
            _dataCell("Developer", 200),
            _salaryCell(salary, change, 100),
          ],
        );
    }
  }

  // 📌 Widget ô tiêu đề
  Widget _headerCell(String title, double width) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
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
  Widget _dataHeaderCell(String text, double width) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  // 📌 Widget ô dữ liệu thông thường
  Widget _dataCell(String text, double width) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
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

  Widget _percentCell(double percent, double width) {
    bool isIncrease = percent > 100;
    bool isNeutral = percent == 100;

    Color color =
        isNeutral ? Colors.grey : (isIncrease ? Colors.green : Colors.red);
    IconData icon = isNeutral
        ? Icons.remove
        : (isIncrease ? Icons.arrow_upward : Icons.arrow_downward);

    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("\$$salary", style: const TextStyle(fontSize: 16)),
          // const SizedBox(width: 8),
          Icon(icon, color: color, size: 18), // Icon mũi tên lên/xuống
          Text(
            "$percent%", // Hiển thị dấu + nếu tăng
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:bividpharma/pages/tongquan/tonkho/compoments/filter_sheet.dart';
import 'package:bividpharma/pages/tongquan/tonkho/viewmodel/inventory_viewmodel.dart';
import 'package:bividpharma/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:provider/provider.dart';

enum TonKhoEnum {
  kenh,
  chinhanh,
  nhomsanpham,
  sanpham,
  handung,
  nhomkho,
  kho,
  nhasanxuat,
  lo
}

extension TonKhoEnumExtension on TonKhoEnum {
  String get name {
    switch (this) {
      case TonKhoEnum.kenh:
        return 'Kênh';
      case TonKhoEnum.chinhanh:
        return 'Chi nhánh';
      case TonKhoEnum.nhomsanpham:
        return 'Nhóm sản phẩm';
      case TonKhoEnum.sanpham:
        return 'Sản phẩm';
      case TonKhoEnum.handung:
        return 'Hạn dùng';
      case TonKhoEnum.nhomkho:
        return 'Nhóm kho';
      case TonKhoEnum.kho:
        return 'Kho';
      case TonKhoEnum.nhasanxuat:
        return 'Nhà sản xuất';
      case TonKhoEnum.lo:
        return 'Lô';
      default:
        return '';
    }
  }
}

class InventoryDetail extends StatefulWidget {
  final TonKhoEnum tonKhoEnum;

  const InventoryDetail({Key? key, required this.tonKhoEnum}) : super(key: key);

  @override
  State<InventoryDetail> createState() => _InventoryDetailState();
}

class _InventoryDetailState extends State<InventoryDetail> {
  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        builder: (context) {
          return FilterBottomSheet(
              onFilterApplied: (startDate, endDate, maCty, maVattu) {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tồn kho theo ${widget.tonKhoEnum.name}",
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
                showFilterBottomSheet(context);
              },
            ),
          ],
        ),
        body: DataTableScreen(tonKhoEnum: widget.tonKhoEnum));
  }
}

class DataTableScreen extends StatelessWidget {
  final TonKhoEnum tonKhoEnum;

  const DataTableScreen({Key? key, required this.tonKhoEnum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InventoryViewmodel viewModel =
        Provider.of<InventoryViewmodel>(context, listen: true);

    final List<Map<String, dynamic>> data = viewModel.dataReport ?? [];
    int column = (tonKhoEnum == TonKhoEnum.kenh ||
            tonKhoEnum == TonKhoEnum.chinhanh ||
            tonKhoEnum == TonKhoEnum.nhomsanpham ||
            tonKhoEnum == TonKhoEnum.nhomkho ||
            tonKhoEnum == TonKhoEnum.kho)
        ? 3
        : 5;

    if (tonKhoEnum == TonKhoEnum.sanpham) {
      column = 7;
    }

    if (tonKhoEnum == TonKhoEnum.lo) {
      column = 8;
    }
    return HorizontalDataTable(
      leftHandSideColumnWidth: (tonKhoEnum == TonKhoEnum.nhomsanpham ||
              tonKhoEnum == TonKhoEnum.sanpham ||
              tonKhoEnum == TonKhoEnum.lo)
          ? 200
          : 120, // Độ rộng cột cố định bên trái
      rightHandSideColumnWidth:
          column * 100, // Độ rộng tổng của các cột bên phải
      isFixedHeader: true, // Cố định tiêu đề
      headerWidgets: _buildHeader(tonKhoEnum),
      leftSideItemBuilder: (context, index) =>
          _buildLeftCell(index, tonKhoEnum, data),
      rightSideItemBuilder: (context, index) =>
          _buildRightCell(index, tonKhoEnum, data),
      itemCount: data.length,
      rowSeparatorWidget: const Divider(height: 1, color: Colors.grey),
      leftHandSideColBackgroundColor: Colors.white,
      rightHandSideColBackgroundColor: Colors.white,
      verticalScrollbarStyle: const ScrollbarStyle(
        isAlwaysShown: true,
        thickness: 5.0,
        radius: Radius.circular(5.0),
      ),
      horizontalScrollbarStyle: const ScrollbarStyle(
        isAlwaysShown: true,
        thickness: 5.0,
        radius: Radius.circular(5.0),
      ),
    );
  }

  /// Tạo tiêu đề
  List<Widget> _buildHeader(TonKhoEnum type) {
    switch (type) {
      case TonKhoEnum.handung:
      case TonKhoEnum.nhasanxuat:
        return [
          _headerCell(type.name, 120),
          _headerCell("SL BIVID", 100),
          _headerCell("GT BIVID", 100),
          _headerCell("SL Uỷ Thác", 100),
          _headerCell("GT Uỷ Thác", 100),
          _headerCell("Tỉ trọng", 100),
        ];
      case TonKhoEnum.lo:
        return [
          _headerCell(type.name, 200),
          _headerCell("Mã lô", 100),
          _headerCell("HSD", 100),
          _headerCell("Số ngày HH", 100),
          _headerCell("SL BIVID", 100),
          _headerCell("GT BIVID", 100),
          _headerCell("SL Uỷ Thác", 100),
          _headerCell("GT Uỷ Thác", 100),
          _headerCell("Tỉ trọng", 100),
        ];
      case TonKhoEnum.sanpham:
        return [
          _headerCell(type.name, 200),
          _headerCell("Mã SP", 100),
          _headerCell("SL BIVID", 100),
          _headerCell("Đơn giá", 100),
          _headerCell("GT BIVID", 100),
          _headerCell("SL Uỷ Thác", 100),
          _headerCell("GT Uỷ Thác", 100),
          _headerCell("Tỉ trọng", 100),
        ];
      default:
        return [
          _headerCell(type.name, type == TonKhoEnum.nhomsanpham ? 200 : 120),
          _headerCell("Số lượng", 100),
          _headerCell("Giá trị", 100),
          _headerCell("Tỉ trọng", 100),
        ];
    }
  }

  /// Tạo cột cố định bên trái
  Widget _buildLeftCell(
      int index, TonKhoEnum type, List<Map<String, dynamic>> data) {
    return Container(
      width: (tonKhoEnum == TonKhoEnum.nhomsanpham ||
              tonKhoEnum == TonKhoEnum.sanpham ||
              tonKhoEnum == TonKhoEnum.lo)
          ? 200
          : 120,
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        () {
          if (tonKhoEnum == TonKhoEnum.sanpham || tonKhoEnum == TonKhoEnum.lo) {
            return data[index]['ten_vt'];
          }
          return data[index]['name'];
        }(),
      ),
    );
  }

  /// Tạo các cột bên phải
  Widget _buildRightCell(
      int index, TonKhoEnum type, List<Map<String, dynamic>> data) {
    if (type == TonKhoEnum.kenh ||
        type == TonKhoEnum.chinhanh ||
        type == TonKhoEnum.nhomsanpham ||
        type == TonKhoEnum.nhomkho ||
        type == TonKhoEnum.kho) {
      return Row(children: [
        _dataCell((data[index]['tongSoLuong'] as num)
            .toDouble()
            .toShortMoneyFormat()),
        _dataCell(
            (data[index]['tongDonGia'] as num).toDouble().toShortMoneyFormat()),
        _dataCell(
            (data[index]['ttrong'] as num).toDouble().toShortMoneyFormat()),
      ]);
    }

    if (type == TonKhoEnum.handung || type == TonKhoEnum.nhasanxuat) {
      return Row(children: [
        _dataCell(
            (data[index]['slBIVID'] as num).toDouble().toShortMoneyFormat()),
        _dataCell(
            (data[index]['gTriBIVID'] as num).toDouble().toShortMoneyFormat()),
        _dataCell(
            (data[index]['slUyThac'] as num).toDouble().toShortMoneyFormat()),
        _dataCell(
            (data[index]['gtriUyThac'] as num).toDouble().toShortMoneyFormat()),
        _dataCell(
            (data[index]['ttrong'] as num).toDouble().toShortMoneyFormat()),
      ]);
    }

    if (type == TonKhoEnum.sanpham) {
      return Row(children: [
        _dataCell(data[index]['ma_vt']),
        _dataCell((data[index]['so_luong_bv'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell((data[index]['don_gia'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell((data[index]['tien_bv'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell((data[index]['so_luong_ut'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell((data[index]['tien_ut'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell(
            (data[index]['TT'] as String).toDoubleSafe().toShortMoneyFormat()),
      ]);
    }

    if (type == TonKhoEnum.lo) {
      return Row(children: [
        _dataCell(data[index]['ma_lo']),
        _dataCell(data[index]['han_dung']),
        _dataCell(data[index]['so_ngay_hethan']),
        _dataCell((data[index]['so_luong_bv'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell((data[index]['tien_bv'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell((data[index]['so_luong_ut'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell((data[index]['tien_ut'] as String)
            .toDoubleSafe()
            .toShortMoneyFormat()),
        _dataCell(
            (data[index]['TT'] as String).toDoubleSafe().toShortMoneyFormat()),
      ]);
    }

    return Row(
      children: [
        _dataCell(""),
        _dataCell(""),
        _dataCell(""),
        _dataCell(""),
      ],
    );
  }

  /// Widget tiêu đề cột
  Widget _headerCell(String title, double width) {
    return Container(
      width: width,
      height: 60,
      alignment: Alignment.centerLeft,
      color: Colors.grey[300],
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  /// Widget ô dữ liệu
  Widget _dataCell(String text) {
    return Container(
      width: 100,
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Text(text),
    );
  }
}

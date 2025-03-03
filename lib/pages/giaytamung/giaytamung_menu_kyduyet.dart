// ignore_for_file: use_build_context_synchronously

import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/model/dtos/giaytamung/giaytamung_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/text_field_multi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';

class MenuGiayTamUng extends StatefulWidget {
  final GiayTamUngArgs args;
  final Future<bool> Function(bool isApproved, GiayTamUngArgs data) onApproved;

  final BuildContext? parentContext;
  const MenuGiayTamUng(
      {Key? key,
      required this.args,
      required this.parentContext,
      required this.onApproved})
      : super(key: key);

  @override
  State<MenuGiayTamUng> createState() => _MenuGiayTamUngState();
}

class _MenuGiayTamUngState extends State<MenuGiayTamUng> {
  late String _cancelText = 'Trả lại';
  late String _okText = 'Xác nhận';
  final TextEditingController _noiDungController = TextEditingController();
  late TextEditingController _tienTamUngController;
  late bool _showTienDuyet = false;
  late bool _showKSNB = false;
  late ShortNhanVien? _selectedNhanVien;

  @override
  void initState() {
    super.initState();
    _selectedNhanVien = null;
    late String amountText = widget.args.tienTamUng == null
        ? '0'
        : widget.args.tienTamUng!.toString();
    amountText = _formatNumber(amountText);

    _tienTamUngController = TextEditingController(text: amountText);
  }

  @override
  Widget build(BuildContext context) {
    _cancelText = (widget.args.tinhTrang == 6) ? 'Không duyệt' : 'Trả lại';
    _okText = (widget.args.tinhTrang == 6) ? 'Đồng ý duyệt' : 'Xác nhận';
    return Material(
        child: SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                title: Text(
                  _okText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: UIHelper.BIVID_BLACK_TEXT_COLOR),
                ),
                leading: const Icon(
                  Icons.check,
                  color: UIHelper.BIVID_PRIMARY_COLOR,
                  size: 32,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  showApprove(widget.parentContext!);
                }),
            ListTile(
              title: Text(
                _cancelText,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                    fontSize: 18,
                    fontStyle: FontStyle.italic),
              ),
              leading: const Icon(Icons.cancel,
                  size: 32, color: UIHelper.BIVID_WARNING_COLOR),
              onTap: () {
                Navigator.of(context).pop();
                showUnApprove(widget.parentContext!);
              },
            ),
          ],
        ),
      ),
    ));
  }

  String _formatNumber(String s) {
    if (s.isEmpty) return '';
    try {
      return NumberFormat.decimalPattern('en').format(double.parse(s));
    } on Exception catch (_) {
      return '';
    }
  }

  void showApprove(BuildContext context) {
    _showKSNB = (widget.args.tinhTrang == 4);
    _showTienDuyet = (widget.args.tinhTrang == 6);

    const String hintText = 'Nhập số tiền duyệt';
    final childList = <Widget>[];
    childList.add(TextFieldMulti(
      noiDungController: _noiDungController,
      labelText: 'Nhập ghi chú',
    ));

    if (_showTienDuyet) {
      childList.add(TextField(
        controller: _tienTamUngController,
        decoration: const InputDecoration(
            prefixText: '', labelText: 'Tiền duyệt', hintText: hintText),
        keyboardType: TextInputType.number,
        onChanged: (string) {
          string = _formatNumber(string.replaceAll(',', ''));
          _tienTamUngController.value = TextEditingValue(
            text: string,
            selection: TextSelection.collapsed(offset: string.length),
          );
        },
      ));
    }
    if (_showKSNB) {
      childList.add(DropdownSearch<ShortNhanVien>(
        popupProps: PopupPropsMultiSelection.menu(
          showSelectedItems: true,
          disabledItemFn: (ShortNhanVien item) => false,
          showSearchBox: true,
          itemBuilder: _nhanvienPopupItemBuilder,
        ),
        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: "Chọn KSNB",
            hintText: "Chọn KSNB",
          ),
        ),
        compareFn: (i, s) => i.maNhanvien == (s.maNhanvien) ? true : false,
        asyncItems: (filter) async {
          return DanhMucService.nhanvien_getShortList(filter: filter);
        },
        clearButtonProps: const ClearButtonProps(
          isVisible: true,
          icon: Icon(Icons.cancel),
        ),
        onChanged: (ShortNhanVien? data) {
          _selectedNhanVien = data;
        },
        selectedItem: _selectedNhanVien,
        dropdownBuilder: _nhanvienDropDown,
      ));
    }
    final bodyContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: childList,
    );
    final dlg = UIHelper.dialog(
        context, "Đồng ý duyệt", "Xác nhận", "Hủy", bodyContent);

    dlg.then((value) async {
      if (value == 1) {
        await doApprove(true);
      }
    });
  }

  void showUnApprove(BuildContext context) {
    final TextEditingController noiDungController = TextEditingController();
    final Widget bodyChild = Stack(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      children: <Widget>[
        TextFieldMulti(
          noiDungController: noiDungController,
          labelText: 'Nhập lý do không duyệt',
        ),
      ],
    );
    final dlg = UIHelper.dialog(
        context, "Không đồng ý duyệt", "Xác nhận", "Hủy", bodyChild);

    dlg.then((value) async {
      if (value == 1) {
        await doApprove(false);
      }
    });
  }

  Widget _nhanvienPopupItemBuilder(
      BuildContext context, ShortNhanVien? item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.fullName ?? ''),
        subtitle: Text(item?.email?.toString() ?? ''),
        leading: const CircleAvatar(
            // this does not work - throws 404 error
            // backgroundImage: NetworkImage(item.avatar ?? ''),
            ),
      ),
    );
  }

  Widget _nhanvienDropDown(BuildContext context, ShortNhanVien? item) {
    if (item == null) {
      return Container();
    }

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(
          // backgroundImage: NetworkImage(item.avatar ?? ''),
          ),
      title: Text(item.fullName!),
      subtitle: Text(
        item.email.toString(),
      ),
    );
  }

  Future<void> doApprove(bool approved) async {
    BuildContext context = widget.parentContext!;
    final tienTamUngText = _tienTamUngController.text.replaceAll(',', '');
    widget.args.noiDungDuyet = _noiDungController.value.text;
    widget.args.tienTamUng =
        double.parse(tienTamUngText.isEmpty ? '0' : tienTamUngText);
    widget.args.listKSNB =
        ((_selectedNhanVien == null) ? '' : _selectedNhanVien!.userName) ?? '';

    try {
      bool isOk = await UIHelper.showProgressDialog(
          context,
          widget.onApproved(approved, widget.args),
          'Đang duyệt hồ sơ...',
          'Duyệt hồ sơ');
      if (isOk) {
        UIHelper.showOk(context, "Duyệt thành công hồ sơ.");
        final mainModel = context.read<MainPageModel>();
        mainModel.giayTamUngStream.add(widget.args.idTamUng!);
        mainModel.documentChartStream.add(widget.args.idTamUng!);
      } else {
        UIHelper.showError(context, "Không thể duyệt hồ sơ.");
      }
    } on Exception catch (_) {
      UIHelper.showError(context, "Lỗi duyệt hồ sơ.");
    }
  }
}

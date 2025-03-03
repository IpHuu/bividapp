// ignore_for_file: use_build_context_synchronously

import 'package:bividpharma/model/dtos/kehoachcongtac/ke_hoach_cong_tac_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/text_field_multi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuKeHoachCongTac extends StatefulWidget {
  final KeHoachCongTacArgs args;
  final Future<bool> Function(bool isApproved, KeHoachCongTacArgs data)
      onApproved;

  final BuildContext? parentContext;
  const MenuKeHoachCongTac(
      {Key? key,
      required this.args,
      required this.parentContext,
      required this.onApproved})
      : super(key: key);

  @override
  State<MenuKeHoachCongTac> createState() => _MenuKeHoachCongTacState();
}

class _MenuKeHoachCongTacState extends State<MenuKeHoachCongTac> {
  late String _cancelText = 'Trả lại';
  late String _okText = 'Xác nhận';
  final TextEditingController _noiDungController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.args.tinhTrang == 4) {
      _cancelText = "Không duyệt";
      _okText = "Đồng ý duyệt";
    }
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

  void showApprove(BuildContext context) {
    final bodyContent = Stack(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      children: <Widget>[
        Expanded(
          child: TextFieldMulti(
            noiDungController: _noiDungController,
            labelText: 'Nhập ghi chú',
          ),
        ),
      ],
    );
    final dlg = UIHelper.dialog(
        context, "Đồng ý duyệt", "Xác nhận", "Hủy", bodyContent);
    dlg.then((value) async {
      if (value == 1) //Xác nhận
      {
        await doApprove(true, _noiDungController.value.text);
      }
    });
  }

  void showUnApprove(BuildContext context) {
    final TextEditingController noiDungController = TextEditingController();
    final bodyContent = Stack(
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
        context, "Không đồng ý duyệt", "Xác nhận", "Hủy", bodyContent);
    dlg.then((value) async {
      if (value == 1) //Xác nhận
      {
        await doApprove(false, noiDungController.text);
      }
    });
  }

  Future<void> doApprove(bool approved, String noiDung) async {
    BuildContext context = widget.parentContext!;
    widget.args.noiDungDuyet = noiDung;
    widget.args.isApproved = approved;
    widget.args.documentId = widget.args.idGiayXinPhep;
    widget.args.option = approved ? 0 : 1;

    bool isOk = await UIHelper.showProgressDialog(
        context,
        widget.onApproved(approved, widget.args),
        'Đang duyệt hồ sơ...',
        'Duyệt hồ sơ');

    if (isOk) {
      UIHelper.showOk(context, "Duyệt thành công hồ sơ.");
      final mainModel = context.read<MainPageModel>();
      mainModel.giayKeHoachCongTacStream.add(widget.args.idGiayXinPhep!);
      mainModel.documentChartStream.add(widget.args.idGiayXinPhep!);
      // ignore: dead_code
    } else {
      UIHelper.showError(context, "Không thể duyệt hồ sơ.");
    }
  }
}

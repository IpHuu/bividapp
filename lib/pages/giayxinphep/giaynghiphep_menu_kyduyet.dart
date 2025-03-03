// ignore_for_file: use_build_context_synchronously

import 'package:bividpharma/model/dtos/giayxinphep/giayxinphep_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/text_field_multi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuGiayNghiPhep extends StatefulWidget {
  final GiayXinPhepArgs args;
  final Future<bool> Function(bool isApproved, GiayXinPhepArgs data) onApproved;

  final BuildContext? parentContext;
  const MenuGiayNghiPhep(
      {Key? key,
      required this.args,
      required this.parentContext,
      required this.onApproved})
      : super(key: key);

  @override
  State<MenuGiayNghiPhep> createState() => _MenuGiayNghiPhepState();
}

class _MenuGiayNghiPhepState extends State<MenuGiayNghiPhep> {
  final String _cancelText = 'Trả lại';

  final String _okText = 'Xác nhận';

  final TextEditingController _noiDungController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      if (value == 1) {
        await doApprove(false, noiDungController.text);
      }
    });
  }

  Future<void> doApprove(bool approved, String noiDung) async {
    BuildContext context = widget.parentContext!;
    try {
      bool isOk = await UIHelper.showProgressDialog(
          context,
          widget.onApproved(approved, widget.args),
          'Đang duyệt hồ sơ...',
          'Duyệt hồ sơ');

      if (isOk) {
        UIHelper.showOk(context, "Duyệt thành công hồ sơ.");
        final mainModel = context.read<MainPageModel>();
        mainModel.giayPhepStream.add(widget.args.giayXinPhepId!);
        mainModel.documentChartStream.add(widget.args.giayXinPhepId!);
        // ignore: dead_code
      } else {
        UIHelper.showError(context, "Không thể duyệt hồ sơ.");
      }
    } on Exception catch (_) {
      UIHelper.showError(context, "Lỗi duyệt hồ sơ.");
    }
  }
}

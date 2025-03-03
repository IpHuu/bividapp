// ignore_for_file: use_build_context_synchronously

import 'package:bividpharma/model/dtos/giayracong/giay_ra_cong_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/text_field_multi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuGiayRaCong extends StatefulWidget {
  final GiayRaCongArgs args;
  final Future<bool> Function(bool isApproved, GiayRaCongArgs data) onApproved;

  final BuildContext? parentContext;
  const MenuGiayRaCong(
      {Key? key,
      required this.args,
      required this.parentContext,
      required this.onApproved})
      : super(key: key);

  @override
  State<MenuGiayRaCong> createState() => _MenuGiayRaCongState();
}

class _MenuGiayRaCongState extends State<MenuGiayRaCong> {
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
    final theme = Theme.of(context);

    final rs = showDialog<int>(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Container(
            width: MediaQuery.of(context).size.width,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: Text(
              "Đồng ý duyệt",
              style: TextStyle(color: theme.primaryColor),
            )),
        content: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(5),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            children: <Widget>[
              TextFieldMulti(
                noiDungController: _noiDungController,
                labelText: 'Nhập ghi chú',
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 0),
            style: TextButton.styleFrom(
              foregroundColor: UIHelper.BIVID_WARNING_COLOR,
            ),
            child: const Text("Hủy"),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context, 1);
            },
            label: const Text(
              "Xác nhận",
              style: TextStyle(color: UIHelper.BIVID_PRIMARY_COLOR),
            ),
            icon: const Icon(Icons.check, size: 20),
          ),
        ],
      ),
    );
    rs.then((value) async {
      if (value == 1) //Xác nhận
      {
        await doApprove(true, _noiDungController.value.text);
      }
    });
  }

  void showUnApprove(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController noiDungController = TextEditingController();
    showDialog<int>(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Container(
            width: MediaQuery.of(context).size.width,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: Text(
              "Không đồng ý duyệt",
              style: TextStyle(color: theme.primaryColor),
            )),
        content: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(5),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            children: <Widget>[
              TextFieldMulti(
                noiDungController: noiDungController,
                labelText: 'Nhập lý do không duyệt',
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 0),
            style: TextButton.styleFrom(
              foregroundColor: UIHelper.BIVID_WARNING_COLOR,
            ),
            child: const Text("Hủy"),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context, 1);
              doApprove(false, noiDungController.text);
            },
            label: const Text(
              "Xác nhận",
              style: TextStyle(color: UIHelper.BIVID_PRIMARY_COLOR),
            ),
            icon: const Icon(Icons.check, size: 20),
          ),
        ],
      ),
    );
  }

  Future<void> doApprove(bool approved, String noiDung) async {
    BuildContext context = widget.parentContext!;
    bool isOk = await UIHelper.showProgressDialog(
        context,
        widget.onApproved(approved, widget.args),
        'Đang duyệt hồ sơ...',
        'Duyệt hồ sơ');

    try {
      if (isOk) {
        UIHelper.showOk(context, "Duyệt thành công hồ sơ.");
        final mainModel = context.read<MainPageModel>();
        mainModel.giayRaCongStream.add(widget.args.giayXinPhepId!);
        mainModel.documentChartStream.add(widget.args.giayXinPhepId!);
      } else {
        UIHelper.showError(context, "Không thể duyệt hồ sơ.");
      }
    } on Exception catch (_) {
      UIHelper.showError(context, "Lỗi duyệt hồ sơ.");
    }
  }
}

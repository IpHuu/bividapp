import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/giaytamung/giaytamung_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/giaytamung/giaytamung_menu_kyduyet.dart';
import 'package:bividpharma/services/dexuatmuahang_service.dart';
import 'package:bividpharma/services/kehoachcongviec_service.dart';
import 'package:bividpharma/services/phieutamung_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/data_loading_card.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class GiayTamUngPreviewPage extends StatefulWidget {
  const GiayTamUngPreviewPage({Key? key}) : super(key: key);
  @override
  State<GiayTamUngPreviewPage> createState() => _GiayTamUngPreviewPageState();
}

class _GiayTamUngPreviewPageState extends State<GiayTamUngPreviewPage> {
  late String _previewUrl = "";
  late int _reportId;
  late int _tinhTrang;
  late double _tienTamUng = 0;
  late String _compnayCode = "";

  late int _idKeHoachCongViec = 0;
  late int _idDeXuatMH = 0;
  late bool _dexuatmuahangBusy = false;
  late bool _kehoachcongviecBusy = false;

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late ThemeData _theme;
  late StreamSubscription<int> _giayTamUngSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'GIẤY TẠM ỨNG';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    final stream = mainModel.giayTamUngStream.stream;
    _giayTamUngSub = stream.listen((event) {
      if (event != _reportId) return;
      refreshReport();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)!.settings.arguments as DocumentArgs;
    setState(() {
      _reportId = arg.reportId;
      _tinhTrang = arg.tinhTrang;
      _compnayCode = arg.maCongTy;
      _showAction = arg.showAction;
    });
    _theme = Theme.of(context);
    _loadReport();
  }

  @override
  void dispose() {
    _giayTamUngSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu =
        _showAction ? ([1, 2, 3, 4, 5, 6, 8].contains(_tinhTrang)) : false;

    final giayTamUngArgs = GiayTamUngArgs(
        tinhTrang: _tinhTrang, idTamUng: _reportId, tienTamUng: _tienTamUng);
    final menuKyDuyet = MenuGiayTamUng(
        parentContext: context,
        args: giayTamUngArgs,
        onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        reportId: _reportId,
        documentCode: DataHelper.tamUngName,
        otherMenuWidget: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: [
              _dexuatmuahangBusy
                  ? DataLoadingCard(visibled: true)
                  : TextButton(
                      style: TextButton.styleFrom(
                        textStyle:
                            TextStyle(fontSize: 12, color: _theme.primaryColor),
                      ),
                      onPressed: (_idDeXuatMH <= 0) ? null : _onViewDXMH,
                      child: const Text('Đề xuất mua hàng'),
                    ),
              _kehoachcongviecBusy
                  ? DataLoadingCard(visibled: true)
                  : TextButton(
                      style: TextButton.styleFrom(
                        textStyle:
                            TextStyle(fontSize: 12, color: _theme.primaryColor),
                      ),
                      onPressed: (_idKeHoachCongViec <= 0) ? null : _onViewKHCV,
                      child: const Text('Kế hoạch công việc'),
                    ),
            ]),
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _onViewDXMH() async {
    setState(() {
      _dexuatmuahangBusy = true;
    });
    final report =
        await PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_LoadReport(
            _idDeXuatMH);

    if (report.reportUrl == null || report.reportUrl!.isEmpty) {
      if (!mounted) return;
      UIHelper.showError(context, 'Không tải được phiếu đề xuất mua hàng');
      return;
    }
    setState(() {
      _dexuatmuahangBusy = false;
    });

    if (!mounted) return;
    UIHelper.openUrlImageFile(
        context, report.reportUrl!, 'Phiếu đề xuất mua hàng');
  }

  void _onViewKHCV() async {
    setState(() {
      _kehoachcongviecBusy = true;
    });
    final report = await KeHoachCongViecService.keHoachCongViec_LoadReport(
        _idKeHoachCongViec);
    if (report.reportUrl == null || report.reportUrl!.isEmpty) {
      if (!mounted) return;
      UIHelper.showError(context, 'Không tải được phiếu kế hoạch công việc.');
      return;
    }
    setState(() {
      _kehoachcongviecBusy = false;
    });
    if (!mounted) return;
    UIHelper.openUrlImageFile(context, report.reportUrl!, 'Kế hoạch công việc');
  }

  Future<void> _loadReport() async {
    await refreshReport();

    final list =
        await GiayTamUngService.giayTamUng_LoadAttachedFiles(_reportId);
    _documents.clear();
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report =
        await GiayTamUngService.giayTamUng_LoadReport(_reportId, _compnayCode);
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl ?? "");
        _idKeHoachCongViec = report.idKeHoachCongViec ?? 0;
        _idDeXuatMH = report.idDeXuatMh ?? 0;
      });
      GiayTamUngService.giayTamUng_LoadOne(_reportId).then((value) {
        if (value == null) return;
        if (mounted) {
          setState(() {
            _tinhTrang = value.tinhTrang;
            _tienTamUng = value.tienTamUng ?? 0;
          });
        }
        // if (_tinhTrang <= 0) {
        //   MyNavigation.back();
        // }
      });
    }
  }

  Future<bool> _onCommandApproved(bool isApproved, GiayTamUngArgs args) {
    return GiayTamUngService.giayTamUng_Approve(
      isApproved: isApproved,
      tinhTrang: args.tinhTrang,
      idTamUng: args.idTamUng,
      noiDungDuyet: args.noiDungDuyet,
      listKSNB: args.listKSNB,
      tienTamUng: args.tienTamUng,
    );
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return GiayTamUngService.giayTamUng_LoadAttachedFile(reportId, documentId);
  }
}

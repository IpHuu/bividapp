import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/thanhquyettoan/thanh_quyet_toan_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/thanhquyettoan/tqt_menu_kyduyet.dart';
import 'package:bividpharma/services/thanhquyettoan_service.dart';
// import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class PhieuThanhQuyetToanPreviewPage extends StatefulWidget {
  const PhieuThanhQuyetToanPreviewPage({Key? key}) : super(key: key);
  @override
  State<PhieuThanhQuyetToanPreviewPage> createState() =>
      _PhieuThanhQuyetToanPreviewPageState();
}

class _PhieuThanhQuyetToanPreviewPageState
    extends State<PhieuThanhQuyetToanPreviewPage> {
  late String _previewUrl = "";
  late int _reportId;
  late int _tinhTrang;

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _phieuTQTSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'PHIẾU THANH QUYẾT TOÁN';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _phieuTQTSub = mainModel.giayTQTStream.stream.listen((event) {
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
      _showAction = arg.showAction;
    });
    _loadReport();
  }

  @override
  void dispose() {
    _phieuTQTSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu =
        _showAction ? ([1, 2, 3, 4, 5, 6, 7, 9].contains(_tinhTrang)) : false;
    final phieuTQTArgs = ThanhQuyetToanArgs(
        tinhTrang: _tinhTrang, idThanhQuyetToan: _reportId, noiDungDuyet: '');
    final menuKyDuyet = MenuPhieuThanhQuyetToan(
        parentContext: context,
        args: phieuTQTArgs,
        onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        reportId: _reportId,
        documentCode: DataHelper.tqtName,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        otherMenuWidget: null,
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _loadReport() async {
    await refreshReport();

    final list =
        await PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadAttachedFiles(
            _reportId);
    _documents.clear();
    if (!mounted) return;
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report =
        await PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadReport(
            _reportId);
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl ?? "");
      });
      PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadOne(_reportId)
          .then((value) {
        if (value == null) return;
        setState(() {
          _tinhTrang = value.tinhTrang;
        });
        if (_tinhTrang <= 0) {
          // MyNavigation.back();
        }
      });
    }
  }

  Future<bool> _onCommandApproved(bool isApproved, ThanhQuyetToanArgs args) {
    return PhieuThanhQuyetToanService.phieuThanhQuyetToan_Approve(
      isApproved: isApproved,
      tinhTrang: args.tinhTrang,
      idThanhQuyetToan: args.idThanhQuyetToan,
      noiDungDuyet: args.noiDungDuyet,
      listDaiDienCTy: args.listDaiDienCTy,
      listKeToanPho: args.listKeToanPho,
      listKeToanTruong: args.listKeToanTruong,
      listKsnb: args.listKsnb,
      listTgd: args.listTgd,
    );
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadAttachedFile(
        reportId, documentId);
  }
}

import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/dexuatmuahang/phieu_de_xuat_mua_hang_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/dexuatmuahang/phieudexuatmuahang_menu_kyduyet.dart';
import 'package:bividpharma/services/dexuatmuahang_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class PhieuDeXuatMuaHangPreviewPage extends StatefulWidget {
  const PhieuDeXuatMuaHangPreviewPage({Key? key}) : super(key: key);
  @override
  State<PhieuDeXuatMuaHangPreviewPage> createState() =>
      _PhieuDeXuatMuaHangPreviewPageState();
}

class _PhieuDeXuatMuaHangPreviewPageState
    extends State<PhieuDeXuatMuaHangPreviewPage> {
  late String _previewUrl = "";
  late int _reportId;
  late int _tinhTrang;

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _phieuDXMHSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'PHIẾU ĐỀ XUẤT MUA HÀNG';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _phieuDXMHSub = mainModel.giayDXMHStream.stream.listen((event) {
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
    _phieuDXMHSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu = _showAction ? ([1, 2, 3, 4].contains(_tinhTrang)) : false;

    final phieuDXMHArgs = PhieuDeXuatMuaHangArgs(
        tinhTrang: _tinhTrang, idDeXuatMh: _reportId, noiDungDuyet: '');
    final menuKyDuyet = MenuPhieuDeXuatMuaHang(
        parentContext: context,
        args: phieuDXMHArgs,
        onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        reportId: _reportId,
        documentCode: DataHelper.deXuatMuaHangName,
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
        await PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_LoadAttachedFiles(
            _reportId);
    _documents.clear();
    if (!mounted) return;
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report =
        await PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_LoadReport(
            _reportId);
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl ?? "");
      });
      PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_LoadOne(_reportId)
          .then((value) {
        if (value == null) return;
        setState(() {
          _tinhTrang = value.tinhTrang;
        });
        if (_tinhTrang <= 0) {
          MyNavigation.back();
        }
      });
    }
  }

  Future<bool> _onCommandApproved(
      bool isApproved, PhieuDeXuatMuaHangArgs args) {
    return PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_Approve(
      isApproved: isApproved,
      tinhTrang: args.tinhTrang,
      idDeXuatMh: args.idDeXuatMh,
      noiDungDuyet: args.noiDungDuyet,
      listDaiDienCTy: args.listDaiDienCTy,
      listKeToan: args.listKeToan,
      listKsnb: args.listKsnb,
    );
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_LoadAttachedFile(
        reportId, documentId);
  }
}

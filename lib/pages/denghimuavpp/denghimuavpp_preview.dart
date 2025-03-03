import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/denghimuavpp/de_nghi_mua_vpp_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/denghimuavpp/denghimuavpp_menu_kyduyet.dart';
import 'package:bividpharma/services/denghimuavpp_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class DeNghiMuaVppPreviewPage extends StatefulWidget {
  const DeNghiMuaVppPreviewPage({Key? key}) : super(key: key);
  @override
  State<DeNghiMuaVppPreviewPage> createState() =>
      _DeNghiMuaVppPreviewPageState();
}

class _DeNghiMuaVppPreviewPageState extends State<DeNghiMuaVppPreviewPage>
    with SingleTickerProviderStateMixin {
  late String? _previewUrl = '';
  late int _reportId;
  late String _compnayCode = '';
  late int _tinhTrang;

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _deNghiMuaVppSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'PHIẾU ĐỀ NGHỊ MUA VPP';
  final DeNghiMuaVppService _apiService = DeNghiMuaVppService();

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _deNghiMuaVppSub = mainModel.giayDNMuaVppStream.stream.listen((event) {
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

    _loadReport();
  }

  @override
  void dispose() {
    _deNghiMuaVppSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu = _showAction ? ([1, 2, 3, 4].contains(_tinhTrang)) : false;

    final deNghiMuaVppArgs = DeNghiMuaVppArgs(
      tinhTrang: _tinhTrang,
      idDeNghi: _reportId,
    );
    final menuKyDuyet = MenuDeNghiMuaVpp(
        parentContext: context,
        args: deNghiMuaVppArgs,
        onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        reportId: _reportId,
        documentCode: DataHelper.deNghiMuaVppName,
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _loadReport() async {
    await refreshReport();
    final list = await _apiService.loadAttachedDocs(_reportId);
    _documents.clear();
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report = await _apiService.loadReport(_reportId, _compnayCode);
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl);
      });
      _apiService.loadOne(_reportId).then((value) {
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

  Future<bool> _onCommandApproved(bool isApproved, DeNghiMuaVppArgs args) {
    return _apiService.doApprove(
      isApproved: isApproved,
      tinhTrang: args.tinhTrang,
      idDeNghi: args.idDeNghi,
      noiDungDuyet: args.noiDungDuyet,
    );
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return _apiService.loadAttachedFile(reportId, documentId);
  }
}

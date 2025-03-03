import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/denghicapvpp/de_nghi_cap_vpp_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/denghicapvpp/denghicapvpp_menu_kyduyet.dart';
import 'package:bividpharma/services/denghicapvpp_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class DeNghiCapVppPreviewPage extends StatefulWidget {
  const DeNghiCapVppPreviewPage({Key? key}) : super(key: key);
  @override
  State<DeNghiCapVppPreviewPage> createState() =>
      _DeNghiCapVppPreviewPageState();
}

class _DeNghiCapVppPreviewPageState extends State<DeNghiCapVppPreviewPage> {
  late String _previewUrl = "";
  late int _reportId;
  late int _tinhTrang;
  // late String _compnayCode = '';

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _phieuDeNghiCapVppSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'ĐỀ NGHỊ CẤP VPP';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _phieuDeNghiCapVppSub =
        mainModel.giayDeNghiCapVppStream.stream.listen((event) {
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
      // _compnayCode = arg.documentCode;
    });
    _loadReport();
  }

  @override
  void dispose() {
    _phieuDeNghiCapVppSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu = _showAction ? ([1, 2].contains(_tinhTrang)) : false;

    final docArgs = DeNghiCapVppArgs(
        tinhTrang: _tinhTrang, idDeNghi: _reportId, noiDungDuyet: '');
    final menuKyDuyet = MenuDeNghiCapVpp(
        parentContext: context, args: docArgs, onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        reportId: _reportId,
        documentCode: DataHelper.deNghiCapVppName,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        otherMenuWidget: null,
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _loadReport() async {
    await refreshReport();
    final list = await DeNghiCapVppService.instance.loadAttachedDocs(_reportId);
    _documents.clear();
    if (!mounted) return;
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report = await DeNghiCapVppService.instance.loadReport(_reportId, '');
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl ?? "");
      });
      DeNghiCapVppService.instance.loadOne(_reportId).then((value) {
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

  Future<bool> _onCommandApproved(bool isApproved, DeNghiCapVppArgs args) {
    args.isApproved = isApproved;
    return DeNghiCapVppService.instance.approve(args);
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return DeNghiCapVppService.instance.loadAttachedFile(reportId, documentId);
  }
}

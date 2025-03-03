import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/denghicapsim/de_nghi_cap_sim_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/denghicapsim/denghicapsim_menu_kyduyet.dart';
import 'package:bividpharma/services/denghicapsim_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class DeNghiCapSimPreviewPage extends StatefulWidget {
  const DeNghiCapSimPreviewPage({Key? key}) : super(key: key);
  @override
  State<DeNghiCapSimPreviewPage> createState() =>
      _DeNghiCapSimPreviewPageState();
}

class _DeNghiCapSimPreviewPageState extends State<DeNghiCapSimPreviewPage>
    with SingleTickerProviderStateMixin {
  late String? _previewUrl = '';
  late int _reportId;
  late String _compnayCode = '';
  late int _tinhTrang;

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _deNghiCapSimSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'PHIẾU ĐỀ NGHỊ CẤP SIM';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _deNghiCapSimSub = mainModel.giayDNCapSimStream.stream.listen((event) {
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
    _deNghiCapSimSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu = _showAction ? ([1, 2, 3].contains(_tinhTrang)) : false;

    final deNghiCapSimArgs = DeNghiCapSimArgs(
      tinhTrang: _tinhTrang,
      idDeNghi: _reportId,
    );
    final menuKyDuyet = MenuDeNghiCapSim(
        parentContext: context,
        args: deNghiCapSimArgs,
        onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        reportId: _reportId,
        documentCode: DataHelper.deNghiCapSimName,
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _loadReport() async {
    await refreshReport();
    final list =
        await DeNghiCapSimService.deNghiCapSim_LoadAttachedFiles(_reportId);
    _documents.clear();
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report = await DeNghiCapSimService.deNghiCapSim_LoadReport(
        _reportId, _compnayCode);
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl);
      });
      DeNghiCapSimService.deNghiCapSim_LoadOne(_reportId).then((value) {
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

  Future<bool> _onCommandApproved(bool isApproved, DeNghiCapSimArgs args) {
    return DeNghiCapSimService.deNghiCapSim_approve(
      isApproved: isApproved,
      tinhTrang: args.tinhTrang,
      idDeNghi: args.idDeNghi,
      noiDungDuyet: args.noiDungDuyet,
    );
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return DeNghiCapSimService.deNghiCapSim_LoadAttachedFile(
        reportId, documentId);
  }
}

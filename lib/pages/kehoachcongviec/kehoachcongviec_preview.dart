import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
// import 'package:bividpharma/pages/kehoachcongviec/dtos/ke_hoach_cong_viec_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/kehoachcongviec/dtos/sign_step_parameter_args.dart';
import 'package:bividpharma/pages/kehoachcongviec/khcv_menu_kyduyet.dart';
import 'package:bividpharma/services/kehoachcongviec_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class KeHoachCongViecPreviewPage extends StatefulWidget {
  const KeHoachCongViecPreviewPage({Key? key}) : super(key: key);
  @override
  State<KeHoachCongViecPreviewPage> createState() =>
      _KeHoachCongViecPreviewPageState();
}

class _KeHoachCongViecPreviewPageState
    extends State<KeHoachCongViecPreviewPage> {
  late String _previewUrl = "";
  late int _reportId;
  late int _tinhTrang;

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _phieuKHCVSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'KẾ HOẠCH CÔNG VIỆC';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _phieuKHCVSub = mainModel.giayKHCVStream.stream.listen((event) {
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
    _phieuKHCVSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _showBottomMenu = _showAction ? ([1, 2, 3].contains(_tinhTrang)) : false;
    _showBottomMenu = _showAction;
    final giayKHCVArgs = SignStepParameterArgs();
    final menuKyDuyet = MenuKeHoachCongViec(
        parentContext: context,
        args: giayKHCVArgs,
        onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        reportId: _reportId,
        documentCode: DataHelper.khcvName,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        otherMenuWidget: null,
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _loadReport() async {
    await refreshReport();

    final list = await KeHoachCongViecService.keHoachCongViec_LoadAttachedFiles(
        _reportId);
    _documents.clear();
    if (mounted) {
      setState(() {
        _documents.addAll(list);
      });
    }
  }

  Future<void> refreshReport() async {
    final report =
        await KeHoachCongViecService.keHoachCongViec_LoadReport(_reportId);
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl ?? "");
      });
      KeHoachCongViecService.keHoachCongViec_LoadOne(_reportId).then((value) {
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

  Future<bool> _onCommandApproved(SignStepParameterArgs args) {
    return KeHoachCongViecService.keHoachCongViec_Approve(args);
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return KeHoachCongViecService.keHoachCongViec_LoadAttachedFile(
        reportId, documentId);
  }
}

import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/model/dtos/giayxinphep/giayxinphep.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/giayxinphep/giayxinphep_item.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/services/giaynghiphep_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/document_fulllist_page.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:flutter/widgets.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class GiayXinPhepListPage extends DocumentFullListPage {
  GiayXinPhepListPage({Key? key})
      : super(key: key, newPageUrl: ScreenRouteName.giayXinPhepDetailPage);
  StreamController<SignedStreamArgs>? _streamController;
  @override
  String get title => 'GIẤY XIN PHÉP';

  @override
  Widget createListItem(IDocument document, bool showAction) {
    GiayXinPhep item = document as GiayXinPhep;
    return GiayXinPhepItem(
        giayNghiPhep: item,
        showAction: showAction,
        commandCallback: commandCallback);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await GiayNghiPhepService.giaynghiphep_LoadPagedData(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  State<DocumentFullListPage> createState() => _GiayXinPhepListPageState();

  @override
  StreamController<SignedStreamArgs>? get updateStreamSub {
    if (_streamController == null) {
      final mainModel =
          UIHelper.bividMainApp.currentContext!.read<MainPageModel>();
      _streamController = mainModel.documentSignedStream;
    }
    return _streamController!;
  }
}

class _GiayXinPhepListPageState extends DocumentFullListPageState {
  _GiayXinPhepListPageState() : super() {
    fetchMyData = _loadMyData;
  }

  final employeeSource = <ShortNhanVien>[];
  final _trinhKyViewKey = GlobalKey<FormBuilderState>();

  late ShortNhanVien _nguoiNhanBanGiao = ShortNhanVien();
  late ShortNhanVien _nguoiTruongBP = ShortNhanVien();
  late ShortNhanVien _nguoiHCNS = ShortNhanVien();
  late bool _nguoiNhanBanGiaoHasError = false;

  @override
  Widget build(BuildContext context) {
    widget.commandCallback = _onActionCommand;
    EasyLoading.instance
      ..textColor = Theme.of(context).primaryColor
      ..indicatorColor = Theme.of(context).primaryColor;
    return super.build(context);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      employeeSource.clear();
      final emps = await DanhMucService.nhanvien_getShortList();
      employeeSource.addAll(emps);
    });
  }

  void _onActionCommand(dynamic arg) {
    GiayXinPhep item = arg as GiayXinPhep;
    UIHelper.showTrinhKyAction(context, (action, item) {
      _onPressed(action, item as GiayXinPhep);
    }, item);
  }

  void _onPressed(DocumentSignAction action, GiayXinPhep item) {
    Navigator.pop(context);
    switch (action) {
      case DocumentSignAction.add:
        break;
      case DocumentSignAction.edit:
        _onEditCommand(item);
        break;
      case DocumentSignAction.delete:
        _onDeleteCommand(item);
        break;
      case DocumentSignAction.preview:
        MyNavigation.intentWithData(
          ScreenRouteName.previewGiayXinPhepPage,
          arguments: DocumentArgs(
              maCongTy: item.maCongTy,
              reportId: item.idGiayXinPhep,
              tinhTrang: item.tinhTrang,
              showAction: false),
        );
        break;
      case DocumentSignAction.post:
        _onPostCommand(item);
        break;
    }
  }

  void _onPostCommand(GiayXinPhep item) async {
    final theme = Theme.of(context);
    final documentOption = await DanhMucService.document_getOptions(
        maCongTy: item.maCongTy,
        state: 0,
        voucherCode: DataHelper.giayPhepName);
    if (documentOption != null) {
      //
      item.listDaiDienCTy = documentOption.defaultPerson;
    }
    final dlg = AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      body: _buildui_trinhKyView(item),
      btnCancelOnPress: () => Navigator.pop(context, DialogAction.cancel),
      btnOkOnPress: () {
        if (!(_trinhKyViewKey.currentState?.saveAndValidate() ?? false)) return;
        Navigator.pop(context, DialogAction.ok);
      },
      btnOkText: "Trình ký",
      btnOkColor: theme.primaryColor,
      btnOkIcon: Icons.check,
      btnCancelText: "Đóng",
      autoDismiss: false,
      onDismissCallback: (type) {
        //
      },
    );
    dlg.show().then((rs) async {
      if (rs == DialogAction.cancel) return;
      try {
        await EasyLoading.show(
          status: 'Đang trình ký...',
          maskType: EasyLoadingMaskType.clear,
        );

        item.listNhanBg = _trinhKyViewKey
            .currentState?.fields['listNhanBg']?.value as String?;
        item.listTruongBp = _trinhKyViewKey
            .currentState?.fields['listTruongBp']?.value as String?;
        item.listDaiDienCTy = _trinhKyViewKey
            .currentState?.fields['listDaiDienCTy']?.value as String?;

        final ok = await GiayNghiPhepService.giaynghiphep_TrinhKy(item);
        if (ok) {
          if (mounted) UIHelper.showOk(context, 'Trình ký hồ sơ thành công.');
        } else {
          if (mounted) {
            UIHelper.showError(
                context, 'Không thể trình ký hồ sơ, vui lòng thử lại sau.');
          }
        }
      } catch (ex) {
        UIHelper.showError(
            context, 'Không thể trình ký hồ sơ, vui lòng thử lại sau.');
      } finally {
        await EasyLoading.dismiss();
      }
    });
  }

  void _onEditCommand(GiayXinPhep item) {
    MyNavigation.intentWithData(
      ScreenRouteName.giayXinPhepDetailPage,
      arguments: item.idGiayXinPhep,
    );
  }

  void _onDeleteCommand(GiayXinPhep item) {
    final theme = Theme.of(context);
    final dlg = AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.rightSlide,
      title: 'Xác nhận hủy',
      desc: 'Hủy bỏ phiếu này, anh chị đồng ý không?',
      btnOkText: "Đồng ý",
      btnCancelText: "Không",
      btnOkColor: theme.primaryColor,
      btnOkIcon: Icons.check,
      btnCancelOnPress: () {
        // Navigator.pop(context, DialogAction.cancel);
      },
      btnOkOnPress: () async {
        try {
          final rs = await GiayNghiPhepService.giaynghiphep_Delete(item);
          if (rs) {
            if (mounted) {
              UIHelper.showOk(context, 'Hủy phiếu thành công.');
              setState(() {
                item.isHuy = true;
              });
            }
          } else {
            if (mounted) {
              UIHelper.showError(
                  context, 'Không thể hủy phiếu, vui lòng thử lại.');
            }
          }
        } catch (e) {
          UIHelper.showError(context, 'Không thể hủy phiếu, vui lòng thử lại.');
        }
      },
    );
    dlg.show();
  }

  Widget _buildui_trinhKyView(GiayXinPhep item) {
    if (item.nguoiNhanBanGiao != null) {
      final foundEmp = employeeSource
          .firstWhereOrNull((e) => e.maNhanvien == item.nguoiNhanBanGiao);
      if (foundEmp != null) {
        item.listNhanBg = foundEmp.userName;
        _nguoiNhanBanGiao = ShortNhanVien.fromMap(foundEmp.toMap());
      }
    }
    if (item.listDaiDienCTy != null) {
      final foundEmp = employeeSource
          .firstWhereOrNull((e) => e.userName == item.listDaiDienCTy);
      if (foundEmp != null) {
        _nguoiHCNS = ShortNhanVien.fromMap(foundEmp.toMap());
      }
    }
    return FormBuilder(
      key: _trinhKyViewKey,
      autovalidateMode: AutovalidateMode.always,
      initialValue: {
        'listNhanBg': item.listNhanBg,
        'listTruongBp': item.listTruongBp,
        'listDaiDienCTy': item.listDaiDienCTy
      },
      child: Column(
        children: [
          _buildUI_EmployeeSearchField(
              'listNhanBg', 'Người nhận bàn giao', _nguoiNhanBanGiao),
          const SizedBox(
            height: 12.0,
          ),
          _buildUI_EmployeeSearchField(
              'listTruongBp', 'Trưởng bộ phận', _nguoiTruongBP),
          const SizedBox(
            height: 12.0,
          ),
          _buildUI_EmployeeSearchField('listDaiDienCTy', 'P.HCNS', _nguoiHCNS),
        ],
      ),
    );
  }

  Widget _buildUI_EmployeeSearchField(
      String fieldName, String labelText, ShortNhanVien selectedItem) {
    return FormBuilderField<String>(
      key: ValueKey("frm_giaynghiphep_trinhkyview_$fieldName"),
      name: fieldName,
      onChanged: (value) {
        var found =
            employeeSource.firstWhereOrNull((item) => item.userName == value);
        if (found != null) {
          selectedItem = found;
        } else {
          selectedItem = ShortNhanVien();
        }
        if (mounted) {
          setState(() {
            _nguoiNhanBanGiaoHasError =
                !(_trinhKyViewKey.currentState?.fields[fieldName]?.validate() ??
                    false);
          });
        }
      },
      builder: (state) {
        return DropdownSearch<ShortNhanVien>(
          selectedItem: selectedItem,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: labelText,
              suffixIcon: _nguoiNhanBanGiaoHasError
                  ? const Icon(Icons.error, color: Colors.red)
                  : const Icon(Icons.check, color: Colors.green),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorText: state.errorText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.all(3.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 5.0),
              ),
            ),
          ),
          dropdownBuilder: (context, selectedItem) {
            String fullName =
                selectedItem == null ? '' : selectedItem.fullName ?? '';
            return Text(fullName);
          },
          onChanged: (ShortNhanVien? data) {
            if (data == null) {
              state.didChange(null);
            } else {
              state.didChange(data.userName);
            }
          },
          asyncItems: (filter) =>
              DanhMucService.nhanvien_getShortList(filter: filter),
          compareFn: (i, s) => i.maNhanvien == s.maNhanvien,
          popupProps: PopupPropsMultiSelection.modalBottomSheet(
            showSearchBox: true,
            itemBuilder: _employeePopupItemBuilder,
          ),
        );
      },
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
    );
  }

  Widget _employeePopupItemBuilder(
    BuildContext context,
    ShortNhanVien? item,
    bool isSelected,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        contentPadding: EdgeInsets.zero,
        title: Text(item?.fullName ?? ''),
        subtitle: Text(item?.email?.toString() ?? ''),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.person),
        ),
      ),
    );
  }

  Future<List<IDocument>> _loadMyData(
      pageNo, pageItems, finished, filterType, searchText) {
    var arg = DocumentSearchParam(
        filterType: filterType,
        finished: finished,
        pageNo: pageNo,
        pageSize: 20,
        searchText: searchText);
    return GiayNghiPhepService.giaynghiphep_GetMyData(arg);
  }
}

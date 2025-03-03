import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/pages/kehoachcongviec/dtos/phieu_ke_hoach_cong_viec.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/kehoachcongviec/kehoachcongviec_item.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/services/kehoachcongviec_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/document_fulllist_page.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
// import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class KeHoachCongViecListPage extends DocumentFullListPage {
  KeHoachCongViecListPage({Key? key})
      : super(key: key, newPageUrl: ScreenRouteName.phieuKHCVDetailPage);

  StreamController<SignedStreamArgs>? _streamController;

  @override
  String get title => 'KẾ HOẠCH CÔNG VIỆC';

  @override
  Widget createListItem(IDocument document, bool showAction) {
    KeHoachCongViec item = document as KeHoachCongViec;
    return KeHoachCongViecItem(
        kehoachcongviec: item,
        showAction: showAction,
        commandCallback: commandCallback);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await KeHoachCongViecService.keHoachCongViec_LoadPagedData(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  State<DocumentFullListPage> createState() => _KeHoachCongViecListPageState();

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

class _KeHoachCongViecListPageState extends DocumentFullListPageState {
  _KeHoachCongViecListPageState() : super() {
    fetchMyData = _loadMyData;
  }

  final employeeSource = <ShortNhanVien>[];
  final _trinhKyViewKey = GlobalKey<FormBuilderState>();

  late ShortNhanVien _nguoiTruongBPLienQuan = ShortNhanVien();
  late ShortNhanVien _nguoiTruongBP = ShortNhanVien();
  late ShortNhanVien _nguoiTGD = ShortNhanVien();
  late bool _nguoiNhanBanGiaoHasError = false;

  @override
  Widget build(BuildContext context) {
    widget.commandCallback = _onActionCommand;
    EasyLoading.instance
      ..textColor = Theme.of(context).primaryColor
      ..indicatorColor = Theme.of(context).primaryColor;
    return super.build(context);
  }

  void _onActionCommand(dynamic arg) {
    KeHoachCongViec item = arg as KeHoachCongViec;
    UIHelper.showTrinhKyAction(context, (action, item) {
      _onPressed(action, item as KeHoachCongViec);
    }, item);
  }

  void _onPressed(DocumentSignAction action, KeHoachCongViec item) {
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
              reportId: item.idKeHoachCongViec,
              tinhTrang: item.tinhTrang,
              showAction: false),
        );
        break;
      case DocumentSignAction.post:
        _onPostCommand(item);
        break;
    }
  }

  void _onPostCommand(KeHoachCongViec item) async {
    final theme = Theme.of(context);
    final documentOption = await DanhMucService.document_getOptions(
        maCongTy: item.maCongTy, state: 0, voucherCode: DataHelper.khcvName);
    if (documentOption != null) {
      //
      item.ndTruongBp = documentOption.defaultPerson;
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

        item.listTruongBp = _trinhKyViewKey
            .currentState?.fields['listTruongBp']?.value as String?;
        item.listTruongBpKhac = _trinhKyViewKey
            .currentState?.fields['listTruongBpKhac']?.value as String?;
        item.listTgd =
            _trinhKyViewKey.currentState?.fields['listTgd']?.value as String?;

        final ok = await KeHoachCongViecService.keHoachCongViec_TrinhKy(item);
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

  void _onEditCommand(KeHoachCongViec item) {
    MyNavigation.intentWithData(
      ScreenRouteName.phieuKHCVDetailPage,
      arguments: item.idKeHoachCongViec,
    );
  }

  void _onDeleteCommand(KeHoachCongViec item) {
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
          final rs = await KeHoachCongViecService.keHoachCongViec_Delete(item);
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

  Widget _buildui_trinhKyView(KeHoachCongViec item) {
    if (item.listTruongBpKhac != null) {
      final foundEmp = employeeSource
          .firstWhereOrNull((e) => e.maNhanvien == item.listTruongBpKhac);
      if (foundEmp != null) {
        item.listTruongBpKhac = foundEmp.userName;
        _nguoiTruongBPLienQuan = ShortNhanVien.fromMap(foundEmp.toMap());
      }
    }
    if (item.listTruongBp != null) {
      final foundEmp = employeeSource
          .firstWhereOrNull((e) => e.userName == item.listTruongBp);
      if (foundEmp != null) {
        _nguoiTruongBP = ShortNhanVien.fromMap(foundEmp.toMap());
      }
    }
    if (item.listTgd != null) {
      final foundEmp =
          employeeSource.firstWhereOrNull((e) => e.userName == item.listTgd);
      if (foundEmp != null) {
        _nguoiTGD = ShortNhanVien.fromMap(foundEmp.toMap());
      }
    }

    return FormBuilder(
      key: _trinhKyViewKey,
      autovalidateMode: AutovalidateMode.always,
      initialValue: {
        'listTruongBp': item.listTruongBp,
        'listTruongBpKhac': item.listTruongBpKhac,
        'listTgd': item.listTgd
      },
      child: Column(
        children: [
          _buildUI_EmployeeSearchField(
              'listTruongBp', 'Trưởng bộ phận', _nguoiTruongBPLienQuan),
          const SizedBox(
            height: 12.0,
          ),
          _buildUI_EmployeeSearchField(
              'listTruongBpKhac', 'Trưởng bộ phận liên quan', _nguoiTruongBP),
          const SizedBox(
            height: 12.0,
          ),
          _buildUI_EmployeeSearchField('listTgd', 'Tổng GĐ', _nguoiTGD),
        ],
      ),
    );
  }

  Widget _buildUI_EmployeeSearchField(
      String fieldName, String labelText, ShortNhanVien selectedItem) {
    return FormBuilderField<String>(
      key: ValueKey("frm_khcv_trinhkyview_$fieldName"),
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
    return KeHoachCongViecService.keHoachCongViec_GetMyData(arg);
  }
}

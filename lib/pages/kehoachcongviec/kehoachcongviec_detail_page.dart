import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/danhmuc/company.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
// import 'package:bividpharma/model/dtos/giayxinphep/giayxinphep.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/kehoachcongviec/dtos/phieu_ke_hoach_cong_viec.dart';
import 'package:bividpharma/pages/system/document_file_attached_view.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/services/kehoachcongviec_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
// import 'package:bividpharma/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:provider/provider.dart';

typedef KhcvUpdateCallback = Future<int> Function(KeHoachCongViec value);

class KeHoachCongViecDetailPage extends StatefulWidget {
  KeHoachCongViecDetailPage({Key? key, this.keHoachCongViecId})
      : super(key: key);
  late int? keHoachCongViecId;

  @override
  State<KeHoachCongViecDetailPage> createState() =>
      _KeHoachCongViecDetailState();
}

class _KeHoachCongViecDetailState extends State<KeHoachCongViecDetailPage>
    with TickerProviderStateMixin {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;

  final ValueNotifier<KeHoachCongViec> _formData =
      ValueNotifier(KeHoachCongViec());
  var _khcv = KeHoachCongViec(
    nguoiTrinhKy: '',
  );

  final _formKey = GlobalKey<FormBuilderState>();
  // final _popupCustomValidationKey = GlobalKey<DropdownSearchState<String>>();
  // bool _companyHasError = false;
  bool _nguoiNhanBanGiaoHasError = false;
  bool _nguoiLamDonHasError = false;
  // bool _tongThoiGianHasError = false;
  bool _loading = false;

  late ShortNhanVien _nguoiNhanBanGiao = ShortNhanVien();
  late ShortNhanVien _nguoiDeNghi = ShortNhanVien();

  final companySource = <Company>[];
  final employeeSource = <ShortNhanVien>[];

  final List<DropdownMenuItem<String>> employeeItems =
      <DropdownMenuItem<String>>[];
  final List<DropdownMenuItem<String>> companyItems =
      <DropdownMenuItem<String>>[];
  // final camketTamUngItems

/*
  var nghiPhepSource = <LoaiNghiPhep>[
    LoaiNghiPhep(1, 'Nghỉ phép năm'),
    LoaiNghiPhep(2, "Ứng phép"),
    LoaiNghiPhep(3, "Nghỉ Ốm (có giấy của bác sĩ)"),
    LoaiNghiPhep(4, "Phép cưới"),
    LoaiNghiPhep(5, "Phép tang"),
    LoaiNghiPhep(6, "Thai sản"),
    LoaiNghiPhep(7, "Nghỉ bù"),
  ];
*/
  final List<bool> _steps = [true, true, true, true];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _configLoading();
      await _loadOtherSource();
      await _loadFormData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)!.settings.arguments as int?;
    widget.keHoachCongViecId = arg;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spinkit = SizedBox(
      height: 16.0,
      child: SpinKitThreeBounce(
        color: theme.primaryColor,
        size: 30.0,
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        final dlg = AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.rightSlide,
          title: 'Thông báo',
          desc:
              'Đóng màn hình và dữ liệu đang nhập sẽ không được lưu. Anh chị đồng ý không?',
          btnOkColor: theme.primaryColor,
          btnCancelOnPress: () {},
          btnOkOnPress: _onClodeView,
        );

        dlg.show();

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thêm KHCV'),
          backgroundColor: theme.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: _formData,
              builder: (context, KeHoachCongViec data, child) {
                return Column(
                  children: [
                    _loading ? spinkit : Container(),
                    FormBuilder(
                      key: _formKey,
                      // enabled: false,
                      onChanged: () {
                        _formKey.currentState!.save();
                        debugPrint(_formKey.currentState!.value.toString());
                      },
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: data.toMap(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 9.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            FormBuilderField(
                                builder: (field) => Container(),
                                name: 'idKeHoachCongViec'),
                            FormBuilderField(
                                builder: (field) => Container(),
                                name: 'listNhanBg'),
                            _renderPart(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        persistentFooterButtons: [
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton.icon(
                    onPressed:
                        _loading ? null : () => _onSaveCommand(context, theme),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor),
                    icon: const Icon(Icons.save),
                    label: const Text(
                      'Lưu',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _onClodeView(),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1, color: theme.primaryColor),
                      backgroundColor: Colors.transparent),
                  child: Text(
                    'Thoát',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSaveCommand(BuildContext context, ThemeData theme) {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      _formKey.currentState!.save();
      final json = _formKey.currentState!.value.toString();
      debugPrint(json);
      // debugPrint(_formKey.currentState?.value.toString());
      final dlg = AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.rightSlide,
        title: 'Xác nhận lưu',
        desc: 'Lưu nội dung KHCV. Anh chị đồng ý không?',
        btnOkColor: theme.primaryColor,
        btnCancelOnPress: () {},
        btnOkOnPress: _callSaveApi,
      );
      dlg.show();
    }
  }

  void _configLoading() {
    final theme = Theme.of(context);
    EasyLoading.instance
      ..textColor = theme.primaryColor
      ..indicatorColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.transparent
      ..indicatorColor = theme.primaryColor
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid;
  }

  _callSaveApi() async {
    final theme = Theme.of(context);
    setState(() {
      _loading = true;
    });
    await EasyLoading.show(
      status: 'Đang lưu dữ liệu...',
      maskType: EasyLoadingMaskType.clear,
    );
    try {
      final mapValue = _formKey.currentState?.value;
      final newMap = Map<String, dynamic>.from(mapValue!);

      newMap['loaiKeHoach'] = newMap['loaiKeHoach'].toString();
      // newMap['tuNgay'] = newMap['tuNgay'].toString();
      // newMap['denNgay'] = newMap['denNgay'].toString();

      KhcvUpdateCallback fnUpdate =
          KeHoachCongViecService.keHoachCongViec_Create;

      if (widget.keHoachCongViecId != null) {
        fnUpdate = KeHoachCongViecService.keHoachCongViec_Update;
      }
      final newItem = KeHoachCongViec.fromMap(newMap);
      final iRs = await fnUpdate.call(newItem);

      if (iRs <= 0) {
        throw Exception('Không thể lưu KHCV.');
      } else {
        if (widget.keHoachCongViecId == null) {
          _khcv.idKeHoachCongViec = iRs;
          _formKey.currentState?.fields['idKeHoachCongViec']?.didChange(iRs);
          widget.keHoachCongViecId = iRs;
          _loadFormData();
        }
      }
      if (mounted) {
        UIHelper.showText(context,
            okText: 'Lưu KHCV thành công.', backColor: theme.primaryColor);
      }
    } catch (e) {
      if (mounted) {
        UIHelper.showText(context,
            okText: 'Không thể lưu KHCV.', showError: true);
      }
    } finally {
      await EasyLoading.dismiss();
      setState(() {
        _loading = false;
      });
    }
  }

  _loadOtherSource() async {
    companySource.clear();
    final comps = await DanhMucService.company_getList();
    companySource.addAll(comps);

    // companyItems.clear();
    companyItems.addAll(companySource
        .map((item) => DropdownMenuItem<String>(
              key: ValueKey('${item.companyCode}-${item.shortName}'),
              alignment: AlignmentDirectional.centerStart,
              value: item.companyCode,
              child: Row(
                children: [
                  SizedBox(
                    height: 32,
                    child: CachedNetworkImage(
                      colorBlendMode: BlendMode.overlay,
                      color: Colors.transparent,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      imageUrl: item.logoUrl!,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      '${item.shortName} - ${item.companyName}',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ))
        .toList());
    if (mounted) setState(() {});

    employeeSource.clear();
    final emps = await DanhMucService.nhanvien_getShortList();
    employeeSource.addAll(emps);
    // employeeItems.clear();
    employeeItems.addAll(employeeSource
        .map((item) => DropdownMenuItem<String>(
              key: ValueKey('${item.maCty}-${item.maNhanvien}'),
              alignment: AlignmentDirectional.centerStart,
              value: item.maNhanvien ?? '',
              child: Text(
                '${item.fullName} - ${item.chucVu}',
                overflow: TextOverflow.visible,
              ),
            ))
        .toList());
    if (mounted) setState(() {});
  }

  _loadFormData() async {
    try {
      if (mounted) {
        setState(() {
          _loading = true;
        });
      }

      final model = context.read<MainPageModel>();
      final userName = model.loginedUser.userName;
      final foundNv = await DanhMucService.nhanvien_getOne(userName: userName);
      if (foundNv != null) {
        setState(() {
          _nguoiDeNghi = foundNv;
        });
      }

      if (widget.keHoachCongViecId != null && widget.keHoachCongViecId! > 0) {
        // Edit form
        final foundData = await KeHoachCongViecService.keHoachCongViec_LoadOne(
            widget.keHoachCongViecId!);
        if (foundData != null) {
          _khcv = foundData;
        }
        _formData.value = _khcv;
        setState(() {});
      } else {
        // new Form
        setState(() {
          _khcv.nguoiTrinhKy = _nguoiDeNghi.maNhanvien;
          _khcv.maNguoiDeNghi = _nguoiDeNghi.maNhanvien;
          _khcv.maCongTy = foundNv?.maCty ?? '';
          _khcv.versionNo = 2;

          _khcv.loaiKeHoach = "KHCV";
          _khcv.veViec = "Lý do";
          _khcv.mucTieu = "Mục tiêu kế hoạch";
          _khcv.thoiGianThucHien = "Thời gian thực hiện";
          _khcv.noiDungKeHoach = "Nội dung kế hoạch";
          _khcv.idKeHoachCongViec = 0;
        });
        _formData.value = _khcv;
      }

      if (_formKey.currentState != null) {
        final mapValue = _khcv.toMap();
        // mapValue['ngayLamDon'] = _khcv.ngayLamDon;
        // mapValue['tuNgay'] = _khcv.tuNgay;
        // mapValue['denNgay'] = _khcv.denNgay;
        _formKey.currentState!.patchValue(mapValue);
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Widget _buildHeaderTitle(String title, bool isExpaned) {
    final theme = Theme.of(context);
    final backColor = isExpaned ? theme.primaryColor : Colors.white;
    final fontColor = isExpaned ? Colors.white : theme.primaryColor;
    return Container(
      color: backColor,
      constraints: const BoxConstraints(
        maxHeight: 10.0,
        minHeight: 10.0,
      ),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: fontColor),
      ),
    );
  }

  Widget _renderPart() {
    final theme = Theme.of(context);
    const bodyPadding =
        EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 10.0);
    final boxDecor = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0)),
      boxShadow: [
        BoxShadow(
          color: theme.primaryColor,
          spreadRadius: 4,
          blurRadius: 25,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
    final documentView = DocumentFileAttachView(
        departmentName: DepartmentEnum.KeHoachCongViec.name,
        reportId: _formData.value.idKeHoachCongViec);

    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _steps[index] = !isExpanded;
        });
      },
      expandedHeaderPadding: const EdgeInsets.only(left: 10.0, right: 8.0),
      elevation: 2.0,
      dividerColor: theme.primaryColor,
      children: <ExpansionPanel>[
        ExpansionPanel(
            backgroundColor: _steps[0] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("1.Thông tin công ty", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      companyItems.isNotEmpty
                          ? FormBuilderDropdown<String>(
                              name: 'maCongTy',
                              decoration: const InputDecoration(
                                labelText: 'Chọn công ty',
                                hintText: 'Chọn công ty',
                              ),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                              items: companyItems,
                              initialValue: '003',
                              onChanged: (val) {
                                if (val == "") {
                                  _formKey.currentState?.fields['maCongTy']
                                      ?.didChange(null);
                                }
                                /* setState(() {
                            _companyHasError = !(_formKey
                                    .currentState?.fields['maCongTy']
                                    ?.validate() ??
                                false);
                          }); */
                              },
                              valueTransformer: (val) => val?.toString(),
                            )
                          : const SizedBox(height: 1.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                        child: FormBuilderTextField(
                          name: 'loaiKeHoach',
                          maxLines: 1,
                          decoration: const InputDecoration(
                            labelText: 'Loại kế hoạch',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                            ),
                            hintText: '',
                          ),
                        ),
                      ),
                      FormBuilderTextField(
                        name: 'veViec',
                        maxLines: 2,
                        decoration: const InputDecoration(
                          labelText: 'Lý do',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          hintText: '',
                        ),
                      ),
                    ]),
              ),
            ),
            isExpanded: _steps[0]),
        ExpansionPanel(
            backgroundColor: _steps[1] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("2.THÔNG TIN NGƯỜI LẬP", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: FormBuilderTextField(
                              readOnly: true,
                              name: "maNguoiDeNghi",
                              decoration: InputDecoration(
                                labelText: 'Người đề nghị',
                                suffixIcon: _nguoiLamDonHasError
                                    ? const Icon(Icons.error, color: Colors.red)
                                    : const Icon(Icons.check,
                                        color: Colors.green),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              onChanged: (value) {
                                //
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 6.0, top: 0.0, bottom: 0.0),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  '${_nguoiDeNghi.fullName}',
                                  style: TextStyle(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '${_nguoiDeNghi.chucVu}',
                                  style: TextStyle(
                                      color: theme.hintColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            isExpanded: _steps[1]),
        ExpansionPanel(
            backgroundColor: _steps[2] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("3.NỘI DUNG KẾ HOẠCH", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(children: [
                  const Divider(
                    height: 15.0,
                  ),
                  FormBuilderTextField(
                    name: 'mucTieu',
                    decoration: InputDecoration(
                      labelText: 'I.Mục tiếu kế hoạch',
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.0),
                      ),
                      hintText: 'Nhập mục tiếu kế hoạch',
                    ),
                    // initialValue: '',
                    keyboardType: TextInputType.multiline,
                    expands: false,
                    minLines: 3,
                    maxLines: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'thoiGianThucHien',
                    decoration: InputDecoration(
                      labelText: 'II.Thời gian thực hiện',
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.0),
                      ),
                      hintText: 'Nhập thời gian thực hiện',
                    ),
                    // initialValue: '',
                    keyboardType: TextInputType.multiline,
                    expands: false,
                    minLines: 3,
                    maxLines: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  FormBuilderTextField(
                    name: 'noiDungKeHoach',
                    decoration: InputDecoration(
                      labelText: 'III.Nội dung kế hoạch',
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.0),
                      ),
                      hintText: 'Nội dung kế hoạch',
                    ),
                    // initialValue: '',
                    keyboardType: TextInputType.multiline,
                    expands: false,
                    minLines: 3,
                    maxLines: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ]),
              ),
            ),
            isExpanded: _steps[2]),
        ExpansionPanel(
            backgroundColor: _steps[3] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("4.Tập tin đính kèm", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: documentView,
              ),
            ),
            isExpanded: _steps[3]),
      ],
    );
  }

  Widget _customPopupItemBuilder(
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
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item. ?? ''),
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.person),
        ),
      ),
    );
  }

  _onClodeView() {
    Navigator.pop(context);
  }
}

class LoaiKHCV {
  LoaiKHCV(this.value, this.description);
  final int value;
  final String description;
}

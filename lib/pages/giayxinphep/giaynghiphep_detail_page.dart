import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/danhmuc/company.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/model/dtos/giayxinphep/giayxinphep.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/system/document_file_attached_view.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/services/giaynghiphep_service.dart';
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

typedef GiayPhepUpdateCallback = Future<int> Function(GiayXinPhep value);

class GiayXinPhepDetailPage extends StatefulWidget {
  GiayXinPhepDetailPage({Key? key, this.giayXinPhepId}) : super(key: key);
  late int? giayXinPhepId;

  @override
  State<GiayXinPhepDetailPage> createState() => _GiayXinPhepDetailState();
}

class _GiayXinPhepDetailState extends State<GiayXinPhepDetailPage>
    with TickerProviderStateMixin {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;

  final ValueNotifier<GiayXinPhep> _formData = ValueNotifier(GiayXinPhep());
  var _giayXinPhep = GiayXinPhep(
    nguoiLamDon: '',
    hinhThucNghi: 1,
  );

  final _formKey = GlobalKey<FormBuilderState>();
  // final _popupCustomValidationKey = GlobalKey<DropdownSearchState<String>>();
  // bool _companyHasError = false;
  bool _nguoiNhanBanGiaoHasError = false;
  bool _nguoiLamDonHasError = false;
  // bool _tongThoiGianHasError = false;
  bool _loading = false;

  late ShortNhanVien _nguoiNhanBanGiao = ShortNhanVien();
  late ShortNhanVien _nguoiXinPhep = ShortNhanVien();

  final companySource = <Company>[];
  final employeeSource = <ShortNhanVien>[];

  final List<DropdownMenuItem<String>> employeeItems =
      <DropdownMenuItem<String>>[];
  final List<DropdownMenuItem<String>> companyItems =
      <DropdownMenuItem<String>>[];
  // final camketTamUngItems

  var nghiPhepSource = <LoaiNghiPhep>[
    LoaiNghiPhep(1, 'Nghỉ phép năm'),
    LoaiNghiPhep(2, "Ứng phép"),
    LoaiNghiPhep(3, "Nghỉ Ốm (có giấy của bác sĩ)"),
    LoaiNghiPhep(4, "Phép cưới"),
    LoaiNghiPhep(5, "Phép tang"),
    LoaiNghiPhep(6, "Thai sản"),
    LoaiNghiPhep(7, "Nghỉ bù"),
  ];

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
    widget.giayXinPhepId = arg;
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
          title: const Text('Thêm Giấy Nghỉ Phép'),
          backgroundColor: theme.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: _formData,
              builder: (context, GiayXinPhep data, child) {
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
                                name: 'idGiayXinPhep'),
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
        desc: 'Lưu nội dung giấy nghỉ phép. Anh chị đồng ý không?',
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

      newMap['ngayLamDon'] = newMap['ngayLamDon'].toString();
      newMap['tuNgay'] = newMap['tuNgay'].toString();
      newMap['denNgay'] = newMap['denNgay'].toString();

      GiayPhepUpdateCallback fnUpdate = GiayNghiPhepService.giaynghiphep_Create;

      if (widget.giayXinPhepId != null) {
        fnUpdate = GiayNghiPhepService.giaynghiphep_Update;
      }
      final newItem = GiayXinPhep.fromMap(newMap);
      final iRs = await fnUpdate.call(newItem);

      if (iRs <= 0) {
        throw Exception('Không thể lưu Giấy xin phép.');
      } else {
        if (widget.giayXinPhepId == null) {
          _giayXinPhep.idGiayXinPhep = iRs;
          _formKey.currentState?.fields['idGiayXinPhep']?.didChange(iRs);
          widget.giayXinPhepId = iRs;
          _loadFormData();
        }
      }
      if (mounted) {
        UIHelper.showText(context,
            okText: 'Lưu Giấy xin phép thành công.',
            backColor: theme.primaryColor);
      }
    } catch (e) {
      if (mounted) {
        UIHelper.showText(context,
            okText: 'Không thể lưu Giấy xin phép.', showError: true);
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
          _nguoiXinPhep = foundNv;
        });
      }

      if (widget.giayXinPhepId != null && widget.giayXinPhepId! > 0) {
        // Edit form
        final foundData = await GiayNghiPhepService.giayNghiPhep_LoadOne(
            widget.giayXinPhepId!);
        if (foundData != null) {
          _giayXinPhep = foundData;
        }
        _formData.value = _giayXinPhep;
        setState(() {});
      } else {
        // new Form
        setState(() {
          _giayXinPhep.nguoiLamDon = _nguoiXinPhep.maNhanvien;
          _giayXinPhep.maCongTy = foundNv?.maCty ?? '';
          _giayXinPhep.ngayLamDon = DateTime.now();
          _giayXinPhep.tuNgay = DateTime.now();
          _giayXinPhep.denNgay = DateTime.now();
          _giayXinPhep.tongThoiGian = 1.0;
          _giayXinPhep.guiNguoi = "Ban giám đốc";
          _giayXinPhep.idGiayXinPhep = 0;
          // _giayXinPhep.nguoiNhanBanGiao = 'BV-HCM-0022';
        });
        _formData.value = _giayXinPhep;
      }

      if (_formKey.currentState != null) {
        final mapValue = _giayXinPhep.toMap();
        mapValue['ngayLamDon'] = _giayXinPhep.ngayLamDon;
        mapValue['tuNgay'] = _giayXinPhep.tuNgay;
        mapValue['denNgay'] = _giayXinPhep.denNgay;
        mapValue['tongThoiGian'] = _giayXinPhep.tongThoiGian?.toString();
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
        departmentName: DepartmentEnum.GiayNghiPhep.name,
        reportId: _formData.value.idGiayXinPhep);

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
                        padding: const EdgeInsets.only(top: 20.0, bottom: 0.0),
                        child: FormBuilderTextField(
                          name: 'guiNguoi',
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: 'Kính gửi',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                            ),
                            hintText: '',
                          ),
                        ),
                      ),
                      FormBuilderDateTimePicker(
                        name: 'ngayLamDon',
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        initialValue: DateTime.now(),
                        inputType: InputType.date,
                        decoration: InputDecoration(
                          labelText: 'Ngày xin phép',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _formKey.currentState!.fields['date']
                                  ?.didChange(null);
                            },
                          ),
                        ),
                        initialTime: const TimeOfDay(hour: 8, minute: 0),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        // locale: const Locale.fromSubtags(languageCode: 'fr'),
                      ),
                    ]),
              ),
            ),
            isExpanded: _steps[0]),
        ExpansionPanel(
            backgroundColor: _steps[1] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle(
                  "2.Thông tin người xin phép", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _giayXinPhep.soPhieuAuto == null
                          ? const SizedBox(
                              height: 0.0,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 0.0,
                                left: 10.0,
                              ),
                              child: Text(
                                'Số phiếu: ${_giayXinPhep.soPhieuAuto ?? ''}',
                                style: TextStyle(
                                    color: theme.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: FormBuilderTextField(
                              readOnly: true,
                              name: "nguoiLamDon",
                              decoration: InputDecoration(
                                labelText: 'Người xin phép',
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
                                  '${_nguoiXinPhep.fullName}',
                                  style: TextStyle(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '${_nguoiXinPhep.chucVu}',
                                  style: TextStyle(
                                      color: theme.hintColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FormBuilderRadioGroup(
                        decoration:
                            const InputDecoration(labelText: 'Loại nghỉ phép'),
                        name: 'hinhThucNghi',
                        validator: FormBuilderValidators.required(),
                        options: nghiPhepSource
                            .map((item) => FormBuilderFieldOption(
                                  value: item.value,
                                  child: Text(
                                    item.description,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ))
                            .toList(growable: false),
                      ),
                    ]),
              ),
            ),
            isExpanded: _steps[1]),
        ExpansionPanel(
            backgroundColor: _steps[2] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("3.Nội dung chi tiết", isExpanded);
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
                    name: 'lyDo',
                    decoration: InputDecoration(
                      labelText: 'Lý do',
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
                      hintText: 'Nhập lý do',
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
                  Row(
                    children: [
                      FormBuilderDateTimePicker(
                        name: 'tuNgay',
                        initialEntryMode: DatePickerEntryMode.calendar,
                        initialValue: DateTime.now(),
                        inputType: InputType.both,
                        decoration: InputDecoration(
                            labelText: 'Từ ngày',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _formKey.currentState!.fields['tuNgay']
                                    ?.didChange(null);
                              },
                            ),
                            constraints: const BoxConstraints(maxWidth: 180.0)),
                        initialTime: const TimeOfDay(hour: 8, minute: 0),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        // locale: const Locale.fromSubtags(languageCode: 'fr'),
                      ),
                      Expanded(
                        child: FormBuilderDateTimePicker(
                          name: 'denNgay',
                          initialEntryMode: DatePickerEntryMode.calendar,
                          initialValue: DateTime.now(),
                          inputType: InputType.both,
                          decoration: InputDecoration(
                            labelText: 'Đến ngày',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _formKey.currentState!.fields['denNgay']
                                    ?.didChange(null);
                              },
                            ),
                            constraints: const BoxConstraints(maxWidth: 180.0),
                          ),
                          initialTime: const TimeOfDay(hour: 8, minute: 0),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          // locale: const Locale.fromSubtags(languageCode: 'fr'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FormBuilderTextField(
                        key: const ValueKey(
                            "frm_giaynghiphep_detail_page_tongThoiGian"),
                        name: 'tongThoiGian',
                        decoration: const InputDecoration(
                          labelText: 'Số ngày nghỉ',
                          errorStyle: TextStyle(height: 0, fontSize: 0.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 120,
                            minHeight: 40,
                          ),
                        ),
                        valueTransformer: (text) => num.tryParse(text ?? '0'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: FormBuilderTextField(
                          key: const ValueKey(
                              "frm_giaynghiphep_detail_page_idCamKetUngPhep"),
                          name: 'idCamKetUngPhep',
                          onChanged: (value) {
                            // _tongThoiGianController.text = value.toString();
                          },
                          decoration: InputDecoration(
                            labelText: 'Cam kết tạm ứng (ID)',
                            suffixIcon:
                                Icon(Icons.check, color: theme.primaryColor),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                              borderSide: BorderSide(color: theme.primaryColor),
                            ),
                            constraints: const BoxConstraints(
                              maxWidth: 120,
                              minHeight: 40,
                            ),
                          ),
                          onSaved: (val) {
                            //
                          },
                          keyboardType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.numeric(),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  FormBuilderField<String>(
                    key: const ValueKey(
                        "frm_giaynghiphep_detail_page_nguoiNhanBanGiao"),
                    name: 'nguoiNhanBanGiao',
                    onChanged: (value) {
                      var found = employeeSource
                          .firstWhereOrNull((item) => item.maNhanvien == value);
                      if (found != null) {
                        _nguoiNhanBanGiao = found;
                      } else {
                        _nguoiNhanBanGiao = ShortNhanVien();
                      }
                      if (mounted) {
                        setState(() {
                          _nguoiNhanBanGiaoHasError = !(_formKey
                                  .currentState?.fields['nguoiNhanBanGiao']
                                  ?.validate() ??
                              false);
                        });
                      }
                    },
                    builder: (state) {
                      return DropdownSearch<ShortNhanVien>(
                        selectedItem: _nguoiNhanBanGiao,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: 'Chọn người nhận bàn giao',
                            suffixIcon: _nguoiNhanBanGiaoHasError
                                ? const Icon(Icons.error, color: Colors.red)
                                : const Icon(Icons.check, color: Colors.green),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorText: state.errorText,
                          ),
                        ),
                        dropdownBuilder: (context, selectedItem) {
                          String fullName = selectedItem == null
                              ? ''
                              : selectedItem.fullName ?? '';
                          return Text(fullName);
                        },
                        onChanged: (ShortNhanVien? data) {
                          if (data == null) {
                            state.didChange(null);
                          } else {
                            state.didChange(data.maNhanvien);
                            _formKey.currentState?.fields['listNhanBg']
                                ?.didChange(data.userName);
                          }
                        },
                        asyncItems: (filter) =>
                            DanhMucService.nhanvien_getShortList(
                                filter: filter),
                        compareFn: (i, s) => i.maNhanvien == s.maNhanvien,
                        popupProps: PopupPropsMultiSelection.modalBottomSheet(
                          showSearchBox: true,
                          itemBuilder: _customPopupItemBuilder,
                          favoriteItemProps: FavoriteItemProps(
                            showFavoriteItems: true,
                            favoriteItems: (us) {
                              return [];
                              // return us.where((e) => e.name.contains("Mrs")).toList();
                            },
                            favoriteItemBuilder: (context, item, isSelected) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[100]),
                                child: Row(
                                  children: [
                                    Text(
                                      "${item.fullName}",
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.indigo),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 8)),
                                    isSelected
                                        ? const Icon(Icons.check_box_outlined)
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    validator: FormBuilderValidators.compose([]),
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

class LoaiNghiPhep {
  LoaiNghiPhep(this.value, this.description);
  final int value;
  final String description;
}

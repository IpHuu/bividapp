// ignore_for_file: constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/danhmuc/company.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/ui/widgets/image_viewer_from_url.dart';
import 'package:bividpharma/ui/widgets/pdf_viewer_from_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum BividThemeEnum { bivid, humana, baoLong }

enum SearchDocumentOption { onlyMyDocument, meInChart, all }

class UIHelper {
  static GlobalKey bividMainApp = GlobalKey();
  static Gradient linearGradientBackground(BuildContext context) =>
      LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white24,
          Theme.of(context).primaryColor,
        ],
      );
  static Gradient linearPrimaryBackground(BuildContext context) =>
      LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Theme.of(context).primaryColor.withOpacity(0.6),
          Theme.of(context).primaryColor,
        ],
      );
  static Gradient lineTopDownBackground(BuildContext context) =>
      const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white10,
          Colors.white,
        ],
      );
  static Gradient lineTopDownWhiteBackground(BuildContext context) =>
      const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white70,
          Colors.white,
        ],
      );
  //BIVID COLOR
  static const Color BIVID_PRIMARY_COLOR_HUMANA =
      Color.fromARGB(255, 4, 97, 72);
  static const Color BIVID_PRIMARY_COLOR = Color.fromARGB(255, 8, 117, 189);
  static const Color BIVID_SECONDARY_COLOR = Color(0xFFFEA839);
  static const Color BIVID_THIRD_COLOR = Color(0xFF9E9D9D);
  static const Color BIVID_WARNING_COLOR = Color(0xFFC72C41);
  static const Color BIVID_WHITE_BACKGROUND_COLOR = Colors.white;
  static const Color BIVID_WHITE_TEXT_COLOR = Colors.white;
  static const Color BIVID_BLACK_TEXT_COLOR = Colors.black;

  //BIVID Theme
  /// ----  Default Theme  ----
  static const _defaultPrimary = Color.fromARGB(255, 8, 117, 189);
  static const _defaultAccent = Color.fromARGB(255, 67, 160, 221);
  static const _defaultBackground = Color.fromARGB(255, 8, 117, 189);
  static ThemeData get defaultTheme {
    return ThemeData(
        primaryColor: _defaultPrimary,
        focusColor: Colors.orangeAccent,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: _defaultAccent)
            .copyWith(background: _defaultBackground));
  }

  /// ----  HUMANA Theme  ----
  static const _humanaPrimary = BIVID_PRIMARY_COLOR_HUMANA;
  static const _humanaAccent = Color.fromARGB(255, 23, 151, 117);
  static const _humanaBackground = BIVID_PRIMARY_COLOR_HUMANA;
  static final humanaTheme = ThemeData(
    primaryColor: _humanaPrimary,
    focusColor: Colors.orangeAccent,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: _humanaAccent)
        .copyWith(background: _humanaBackground),
  );

  /// ----  BAOLONG Theme  ----
  static const _baolongPrimary = Color(0xFFE91E63);
  static const _baolongAccent = Color(0xFF0C7D9C);
  static const _baolongBackground = Color(0xFFFFFFFF);
  static final baolongTheme = ThemeData(
      primaryColor: _baolongPrimary,
      focusColor: Colors.orangeAccent,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: _baolongAccent)
          .copyWith(background: _baolongBackground));

  // SPACE
  static dynamicHeight(double height) => ScreenUtil().setHeight(height);
  static dynamicWidth(double width) => ScreenUtil().setWidth(width);
  static dynamicSp(double fontsize) => ScreenUtil().setSp(fontsize);

// System option
  static final numberFormater = NumberFormat("#,##0.00", "en_US");
  static InputBorder get lookupInputBorder => const OutlineInputBorder(
      borderSide:
          BorderSide(color: UIHelper.BIVID_BLACK_TEXT_COLOR, width: 1.0));
// Common Shared Functions
  static void setupLoading(BuildContext context) {
    final theme = Theme.of(context);
    EasyLoading.instance
      ..textColor = theme.primaryColor
      ..indicatorColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.transparent
      ..indicatorColor = theme.primaryColor
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid;
  }

  static nextScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return screen;
        },
      ),
    );
  }

  static showSnackBar(BuildContext context, String messageText) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          messageText,
        ),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () => {},
        ),
      ),
    );
  }

  static void showError(BuildContext context, String errorText) {
    final theme = Theme.of(context);
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
              ),
              const SizedBox(
                width: 9,
              ),
              Expanded(
                child: Text(
                  errorText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: theme.cardColor,
        ),
      );
    } on Exception catch (_) {}
  }

  static Future<bool> showProgressDialog(BuildContext context,
      Future<bool> callBack, String messageText, String titleText) async {
    try {
      final result = await ProgressDialog.future(
        context,
        future: Future.delayed(const Duration(seconds: 3), () async {
          try {
            final rs = await callBack;
            return rs;
          } on Exception catch (_) {
            return false;
          }
        }),
        message: Text(messageText),
        title: Text(titleText),
        dismissable: false,
      );
      return result;
    } on Exception catch (e, _) {
      rethrow;
    } finally {}
  }

  static void showOk(BuildContext context, String okText) {
    final theme = Theme.of(context);
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(
                Icons.check,
                color: Colors.white,
              ),
              const SizedBox(
                width: 9,
              ),
              Expanded(
                child: Text(
                  okText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: theme.primaryColor,
        ),
      );
    } on Exception catch (_) {}
  }

  static void showText(context,
      {String okText = '',
      bool showError = false,
      Color backColor = Colors.blue}) {
    final bgColor = showError ? Colors.red : backColor;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
            Text(
              okText,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: bgColor,
      ),
    );
  }

  static Future<void> launchInBrowser(BuildContext context, String url) async {
    final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("Tài liệu đính kèm"),
                backgroundColor: theme.colorScheme.background,
              ),
              body: SingleChildScrollView(
                  child: SizedBox(
                height: size.height - 100,
                child: WebViewWidget(controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..loadRequest(Uri.parse(
                      'https://docs.google.com/gview?url=$url&embedded=true')))
              )))),
    );
  }

  static Future<void> openUrlImageFile(
      BuildContext context, String url, String title) async {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (_) => ImageViewerFromUrl(
          url: url,
          fileName: title,
        ),
      ),
    );
  }

  static Future<void> openUrlPdfFile(
      BuildContext context, String url, String title) async {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (_) => PDFViewerFromUrl(
          url: url,
          fileName: title,
        ),
      ),
    );
  }

  static bool isUsingDevUI(BuildContext context) {
    final model = context.read<MainPageModel>();
    try {
      return model.userSettings.usingDevelopingUI;
    } on Exception catch (_) {
      return false;
    }
  }

  static Widget buildExpanedHeaderTitle(
      BuildContext context, String title, bool isExpaned) {
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

  static DropdownMenuItem<String> buildCompanyDropdownItem(Company item) {
    return DropdownMenuItem<String>(
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
              progressIndicatorBuilder: (context, url, progress) => Center(
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
    );
  }

  static Widget buildPopupItemSearch(BuildContext context, String? title,
      String? subtitle, bool isSelected, IconData icon) {
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
        title: Text(title ?? ''),
        subtitle: Text(subtitle ?? ''),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(icon),
        ),
      ),
    );
  }

  static Widget formBuilderTextField({
    String fieldName = '',
    String labelText = '',
    bool readOnly = false,
    bool hasError = false,
    VoidCallback? suffixCallback,
    bool onlyNumber = false,
  }) {
    return FormBuilderTextField(
        readOnly: readOnly,
        name: fieldName,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: hasError
              ? const Icon(Icons.error, color: Colors.red)
              : const Icon(Icons.check, color: Colors.green),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          border: const OutlineInputBorder(
            borderSide:
                BorderSide(color: UIHelper.BIVID_BLACK_TEXT_COLOR, width: 1.0),
          ),
        ),
        keyboardType: onlyNumber ? TextInputType.number : null,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]));
  }

  static Widget formBuilderDateTimeField({
    String fieldName = '',
    String labelText = '',
    VoidCallback? suffixCallback,
  }) {
    return FormBuilderDateTimePicker(
      name: fieldName,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialValue: DateTime.now(),
      inputType: InputType.date,
      decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: suffixCallback,
          ),
          border: UIHelper.lookupInputBorder),
      initialTime: const TimeOfDay(hour: 8, minute: 0),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      // locale: const Locale.fromSubtags(languageCode: 'fr'),
    );
  }

  static void showTrinhKyAction(
      BuildContext context, TrinhKyActionCallback? action, dynamic item) {
    showMaterialModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (context) => Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                  onPressed: () => action?.call(DocumentSignAction.post, item),
                  icon: const Icon(
                    Icons.file_open,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Trình ký',
                    style: TextStyle(color: Colors.black),
                  )),
              const Divider(
                color: Colors.black,
                height: 5.0,
              ),
              TextButton.icon(
                  onPressed: () => action?.call(DocumentSignAction.edit, item),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Sửa phiếu',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton.icon(
                  onPressed: () =>
                      action?.call(DocumentSignAction.delete, item),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  label: const Text('Hủy phiếu',
                      style: TextStyle(color: Colors.black))),
              const Divider(
                color: Colors.black,
                height: 5.0,
              ),
              TextButton.icon(
                  onPressed: () =>
                      action?.call(DocumentSignAction.preview, item),
                  icon: const Icon(
                    Icons.print,
                    color: Colors.black,
                  ),
                  label: const Text('Xem biểu mẫu',
                      style: TextStyle(color: Colors.black))),
            ]),
      ),
    );
  }

  static Future<int?> dialog(
    BuildContext context,
    String titleText,
    String approvedText,
    String cancelText,
    Widget bodyContent,
  ) {
    final theme = Theme.of(context);
    final dlg = showDialog<int>(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        titlePadding: const EdgeInsets.all(3.0),
        contentPadding: const EdgeInsets.all(3.0),
        iconPadding: const EdgeInsets.all(3.0),
        actionsPadding: const EdgeInsets.all(8.0),
        title: Container(
            width: MediaQuery.of(context).size.width,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: Center(
              child: Text(
                titleText,
                style: TextStyle(color: theme.primaryColor),
              ),
            )),
        content: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(5),
          child: bodyContent,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 0),
            style: TextButton.styleFrom(
              foregroundColor: UIHelper.BIVID_WHITE_TEXT_COLOR,
              backgroundColor: UIHelper.BIVID_WARNING_COLOR,
            ),
            child: Text(cancelText),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context, 1);
            },
            style: TextButton.styleFrom(
              foregroundColor: UIHelper.BIVID_WHITE_TEXT_COLOR,
              backgroundColor: theme.primaryColor,
            ),
            label: Text(
              approvedText,
              style: const TextStyle(color: UIHelper.BIVID_WHITE_TEXT_COLOR),
            ),
            icon: const Icon(Icons.check, size: 20),
          ),
        ],
      ),
    );
    return dlg;
  }

  static AwesomeDialog dialogCreateDelete<T>(BuildContext context,
      {Function()? okCallback}) {
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
      btnOkOnPress: okCallback,
    );
    return dlg;
  }
}

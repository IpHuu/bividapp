import 'package:bividpharma/model/dtos/riengtu/tra_cuu_nhan_vien.dart';
import 'package:bividpharma/services/riengtu_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:line_icons/line_icons.dart';
import 'package:searchfield/searchfield.dart';
import 'package:bividpharma/common/utils.dart' as utils;

class TraCuuDienThoaiPage extends StatefulWidget {
  TraCuuDienThoaiPage({Key? key}) : super(key: key) {
    // load bang cham cong
  }

  @override
  State<TraCuuDienThoaiPage> createState() => _TraCuuDienThoaiState();
}

class _TraCuuDienThoaiState extends State<TraCuuDienThoaiPage>
    with TickerProviderStateMixin {
  double? scrolledUnderElevation;
  late final ValueNotifier<List<TraCuuNhanVien>> _nhanViens;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  /* final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>(); */
  final TextEditingController _txtSearchController = TextEditingController();
  final ExpandableController _searchHeaderController = ExpandableController(
    initialExpanded: true,
  );
  final List<String> _searchCached = [];
  var _loading = false;

  @override
  void initState() {
    super.initState();

    _nhanViens = ValueNotifier([]);
    _resetRefresh();
  }

  @override
  Widget build(BuildContext context) {
    configLoading();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tra Cứu Thông Tin Nội Bộ"),
          scrolledUnderElevation: scrolledUnderElevation,
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: <Widget>[
            IconButton(
              icon: const Icon(LineIcons.search),
              tooltip: 'Lọc dữ liệu',
              onPressed: () {
                _searchHeaderController.toggle();
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSearchForm(),
            ValueListenableBuilder<List<TraCuuNhanVien>>(
              valueListenable: _nhanViens,
              builder: (context, value, child) {
                return Flexible(
                    child: Container(child: _buildListNhanVien(value)));
              },
            ),
          ],
        ));
  }

  Widget _buildSearchForm() {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final textSearch = Form(
        key: _formKey,
        child: SearchField(
          controller: _txtSearchController,
          suggestions:
              _searchCached.map((e) => SearchFieldListItem(e)).toList(),
          suggestionState: Suggestion.expand,
          textInputAction: TextInputAction.next,
          hint: 'Nhập tên nhân viên, chức vụ...',
          // hasOverlay: true,
          suggestionStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.8),
          ),
          validator: null,
          searchInputDecoration: SearchInputDecoration(
            constraints: const BoxConstraints(
              maxHeight: 32,
            ),
            contentPadding: const EdgeInsets.all(7),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.primaryColor.withOpacity(0.8),
                width: 1,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
          maxSuggestionsInViewPort: 6,
          itemHeight: 50,
          onSubmit: (x) {
            _resetRefresh();
          },
        ));

    return ExpandablePanel(
      controller: _searchHeaderController,
      collapsed: Container(),
      expanded: Container(
        margin: const EdgeInsets.only(
          left: 1,
          right: 1,
        ),
        constraints: BoxConstraints(minWidth: screenSize.width),
        decoration: BoxDecoration(
            gradient: UIHelper.lineTopDownBackground(context),
            border: Border.all(width: 1, color: theme.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 7,
            right: 7,
            top: 10,
            bottom: 10,
          ),
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 3.0,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Text('Điều kiện lọc',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              textSearch,
            ],
          ),
        ),
      ),
    );
  }

  void configLoading() {
    final theme = Theme.of(context);
    EasyLoading.instance
      ..textColor = theme.primaryColor
      ..indicatorColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.transparent
      ..indicatorColor = theme.primaryColor
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid;
  }

  Future<void> _resetRefresh() async {
    await EasyLoading.show(
      status: 'Đang tải...',
      maskType: EasyLoadingMaskType.clear,
    );
    setState(() {
      _loading = true;
    });
    try {
      List<TraCuuNhanVien> list =
          await RiengTuService.searchNhanVien(_txtSearchController.text);
      setState(() {
        _nhanViens.value.clear();
        _nhanViens.value.addAll(list);
      });
    } finally {
      setState(() {
        _loading = false;
      });
      await EasyLoading.dismiss();
    }
  }

  Widget _buildListNhanVien(List<TraCuuNhanVien> source) {
    const sizeSpace = SizedBox(
      height: 8,
    );
    const textStyle = TextStyle(color: Colors.black54);

    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: source.length,
        itemBuilder: (BuildContext context, int index) {
          TraCuuNhanVien item = source[index];

          final phoneNumber = item.tel ?? '';

          final subWidgets = <Widget>[];
          subWidgets.addAll(<Widget>[
            sizeSpace,
            Text(
              '${item.tenBophan} ${item.chinhanhnhanvien}',
              textAlign: TextAlign.start,
              style: textStyle,
            ),
            sizeSpace,
            Text(
              '👤 ${item.tenChucvu}',
              style: textStyle,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 24,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                      textStyle: const TextStyle(fontSize: 13),
                    ),
                    onPressed: phoneNumber.isEmpty
                        ? null
                        : () => utils.dialCall(phoneNumber),
                    child: Text('📞 ${item.tel}'),
                  ),
                ),
                Text('Ext: ${item.lienHe1}')
              ],
            ),
          ]);
          if (item.email != null) {
            if (item.email!.isNotEmpty) {
              subWidgets.addAll(<Widget>[
                SizedBox(
                  height: 24,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                      textStyle: const TextStyle(fontSize: 13),
                    ),
                    onPressed: () => utils.mailTo(item.email!, 'BIVID Pharma'),
                    child: Text('📧 ${item.email}'),
                  ),
                ),
              ]);
            }
          }
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListTile(
                minLeadingWidth: 8.0,
                leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      imageUrl: item.logoUrl!,
                    )),
                title: Text(
                  '${item.tenNhanvien}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    children: subWidgets,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

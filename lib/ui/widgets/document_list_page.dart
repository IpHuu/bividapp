// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/main_page_model.dart';
// import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/empty_list_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:line_icons/line_icons.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:searchfield/searchfield.dart';

abstract class DocumentListPage extends StatefulWidget {
  DocumentListPage({Key? key, this.newPageUrl}) : super(key: key);

  // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @protected
  final String _title = '';

  @protected
  final String? newPageUrl;

  //set title(String value) => _title = value;
  @protected
  String get title => _title;

  @protected
  DocumentActionCallback? commandCallback;

  @protected
  Future<List<IDocument>> loadPaged(DocumentSearchParam args);

  @protected
  Widget createListItem(IDocument document);

  @override
  State createState() => DocumentListPageState();
}

class DocumentListPageState extends State<DocumentListPage> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  late MainPageModel _mainPageModel;
  late int _pageNo = 1;
  final List<IDocument> _documents = [];
  final List<int> _itemsOfLastPage = [];

  late bool _isLastPage = false;
  late bool _isLoadingMore = false;
  late bool _isNoMoreItem = false;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  final _listController = ScrollController();
  late bool _isLoading = false;

  final List<bool> _isSelected = <bool>[false, false, true];
  late int _currentIndex = 2;

  final TextEditingController _txtSearchController = TextEditingController();
  final ExpandableController _searchHeaderController = ExpandableController(
    initialExpanded: false,
  );

  final GroupButtonController _groupSearchController = GroupButtonController(
    selectedIndex: 2,
  );
  @protected
  DocumentFetchPagedCallback? fetchMyData;

  @protected
  void onActionCommand() {}
  //SearchDocumentOption _searchOption = SearchDocumentOption.onlyMyDocument;
  @override
  void initState() {
    super.initState();
    _mainPageModel = context.read<MainPageModel>();
    /* _listController.addListener(() {
      if (_listController.position.atEdge) {
        bool reachedBottom = _listController.position.pixels != 0;
        if (reachedBottom) {
          //_onLoading();
        }
      }
    }); */
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    late Widget? newButton;
    if (widget.newPageUrl != null && widget.newPageUrl!.isNotEmpty) {
      newButton = FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, widget.newPageUrl!);
        },
        backgroundColor: theme.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
    } else {
      newButton = null;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
        // elevation: 10,
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
        children: [
          _buildFilterView(),
          Expanded(
            child: Container(
              color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
              child: _buildBody(),
            ),
          )
        ],
      ),
      floatingActionButton: newButton,
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          // backgroundColor: Color(0x44000000),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              overflowAlignment: OverflowBarAlignment.center,
              alignment: MainAxisAlignment.center,
              overflowSpacing: 0.0,
              spacing: 0,
              children: <Widget>[
                ToggleButtons(
                  color: theme.primaryColor,
                  direction: Axis.horizontal,
                  focusColor: Colors.red,
                  selectedColor: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  fillColor: theme.primaryColor,
                  selectedBorderColor: theme.primaryColor,
                  disabledColor: Colors.grey,
                  onPressed: (int index) {
                    setState(() {
                      if (_isLoading) return;
                      for (int buttonIndex = 0;
                          buttonIndex < _isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          _isSelected[buttonIndex] = true;
                          _currentIndex = buttonIndex;
                        } else {
                          _isSelected[buttonIndex] = false;
                        }
                      }
                    });
                    _resetRefresh();
                  },
                  isSelected: _isSelected,
                  children: <Widget>[
                    _toolbarButton(
                        _isSelected[0], Icons.person_search, 'Tôi trình ký'),
                    _toolbarButton(
                        _isSelected[1], Icons.folder_open, 'Tôi đã duyệt'),
                    _toolbarButton(_isSelected[2], Icons.inbox, 'Tất cả'),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  final _formKey = GlobalKey<FormState>();
  final List<String> _searchCached = [];
  final List<String> buttonTexts = const [
    "Tôi trình ký",
    "Tôi đã duyệt",
    "Tất cả",
  ];

  Widget _buildFilterView() {
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
          hint: 'Tìm kiếm hồ sơ',
          //hasOverlay: true,
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

  SizedBox _toolbarButton(bool selected, IconData icon, String title) {
    return selected
        ? SizedBox(
            width: 80,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              clipBehavior: Clip.hardEdge,
              spacing: 5.0,
              children: [
                const Icon(Icons.inbox),
                Text(
                  title,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
        : SizedBox(
            width: 50,
            height: double.infinity,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white),
              child: Icon(icon),
            ),
          );
  }

  // ignore: unused_element
  Widget _groupButtons(ThemeData theme) {
    return GroupButton(
      controller: _groupSearchController,
      options: GroupButtonOptions(
          selectedColor: theme.primaryColor,
          borderRadius: BorderRadius.circular(100),
          mainGroupAlignment: MainGroupAlignment.start,
          crossGroupAlignment: CrossGroupAlignment.start,
          groupRunAlignment: GroupRunAlignment.start,
          groupingType: GroupingType.wrap,
          spacing: 3,
          alignment: Alignment.centerLeft),
      enableDeselect: true,
      isRadio: true,
      onSelected: (text, index, isSelected) {
        _groupSearchController.selectIndex(index);
        _resetRefresh();
        debugPrint('$index, $text');
      },
      buttons: buttonTexts,
    );
  }

  void _resetRefresh() {
    setState(() {
      _pageNo = 1;
    });
    _onRefresh();
  }

  Widget _buildBody() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      footer: CustomFooter(
        builder: (context, mode) => _buildListFooter(context, mode),
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: _buildList(),
    );
  }

  Future<void> _onRefresh() async {
    _refreshController.headerMode!.value = RefreshStatus.refreshing;
    try {
      await _onLoading();
    } finally {
      _refreshController.refreshCompleted();
    }
  }

  Future<void> _onLoading() async {
    if (_pageNo <= 1) {
      _documents.clear();
    }
    setState(() {
      _isLoading = true;
    });
    await _refreshData();
    _refreshController.loadComplete();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildListFooter(BuildContext context, LoadStatus? mode) {
    Widget body;
    if (mode == LoadStatus.idle) {
      body = const Text("pull up load");
    } else if (mode == LoadStatus.loading) {
      body = const CupertinoActivityIndicator();
    } else if (mode == LoadStatus.failed) {
      body = const Text("Load Failed!Click retry!");
    } else if (mode == LoadStatus.canLoading) {
      body = const Text("release to load more");
    } else {
      body = const Text("Không còn dữ liệu");
    }
    return SizedBox(
      height: 55.0,
      child: Center(child: body),
    );
  }

  Widget _buildList() {
    final theme = Theme.of(context);
    final isEmpty = _documents.isEmpty && !_isLoading;
    final Widget emptyWidget = (isEmpty)
        ? EmptyListWidget(
            emptyText: 'Không có dữ liệu',
            onRefresh: _onRefresh,
          )
        : Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.search_circle_fill,
                    size: 48,
                    color: theme.primaryColor,
                  ),
                ),
                DefaultTextStyle(
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Horizon',
                      color: theme.primaryColor),
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    TypewriterAnimatedText('Đang tải dữ liệu...'),
                    WavyAnimatedText('Đang tải dữ liệu...',
                        speed: const Duration(milliseconds: 100)),
                    TypewriterAnimatedText('Đang tải dữ liệu...'),
                  ]),
                ),
              ],
            ),
          );
    final readMoreText = (_isNoMoreItem ? 'Tải lại' : 'Xem thêm');
    if (_documents.isEmpty) {
      return Center(child: emptyWidget);
    } else {
      return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListView.builder(
              controller: _listController,
              itemCount: _documents.length + 1,
              itemBuilder: (context, index) {
                if (index == _documents.length) {
                  return Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _isNoMoreItem
                          ? const Text('Không còn dữ liệu.')
                          : Container(),
                      TextButton(
                        onPressed: _isLoadingMore ? null : _onLoadMoreData,
                        child: Text(
                          _isLoadingMore ? 'Đang tải...' : readMoreText,
                          textAlign: _isNoMoreItem
                              ? TextAlign.center
                              : TextAlign.start,
                          style: TextStyle(color: theme.primaryColor),
                        ),
                      ),
                    ],
                  ));
                } else {
                  final item = _documents[index];
                  return widget.createListItem(item);
                }
              }));
    }
  }

  void _onLoadMoreData() async {
    setState(() {
      _isLoadingMore = true;
    });
    try {
      await _onLoading();
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  Future<List<IDocument>> _loadPaged(int pageNo) async {
    try {
      bool finishedFilter = true; //(_currentIndex > 0);
      int filterType = _currentIndex;
      filterType = (filterType < 0) ? 0 : filterType;
      // if (!finishedFilter) filterType = 2;
      var arg = DocumentSearchParam(
          filterType: filterType,
          finished: finishedFilter,
          pageNo: pageNo,
          pageSize: _mainPageModel.pageSize,
          searchText: _txtSearchController.text);
      final list = <IDocument>[];

      if (fetchMyData != null && filterType == 0) {
        list.addAll(await fetchMyData!.call(arg.pageNo!, arg.pageSize!,
            arg.finished!, arg.filterType!, arg.searchText!));
      } else {
        list.addAll(await widget.loadPaged(arg));
      }

      // var list = await widget.loadPaged(arg);
      return list;
    } on Exception catch (_, ex) {
      debugPrint(ex.toString());
    } finally {}
    return <IDocument>[];
  }

  Future<void> _refreshData() async {
    final newItems = await _loadPaged(_pageNo);
    _isLastPage = newItems.isEmpty || newItems.length < _mainPageModel.pageSize;
    if (!_isLastPage) {
      _pageNo++;
      if (mounted) {
        setState(() {
          _isNoMoreItem = false;
        });
      }
    } else {
      for (var item in _itemsOfLastPage) {
        final found =
            _documents.firstWhere((e) => e.getId() == item, orElse: () {
          EmptyDocument emptyItem = EmptyDocument();
          return emptyItem;
        });
        if (found.getId() != -1) {
          _documents.remove(found);
        }
      }
      _itemsOfLastPage.clear();
      _itemsOfLastPage.addAll(newItems.map((e) => e.getId()));
      if (mounted) {
        setState(() {
          _isNoMoreItem = true;
        });
      }
    }
    if (mounted) {
      setState(() {
        _documents.addAll(newItems);
      });
    }
  }
}

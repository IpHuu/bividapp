// ignore_for_file: unused_element

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart' as badges;
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/tuyendung_page_model.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/data_loading_card.dart';
import 'package:bividpharma/ui/widgets/empty_list_widget.dart';
import 'package:bividpharma/ui/widgets/funtion_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:line_icons/line_icons.dart';
import 'package:expandable/expandable.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class TuyenDungMainPage extends StatefulWidget {
  const TuyenDungMainPage({Key? key}) : super(key: key);

  @override
  State<TuyenDungMainPage> createState() => _TuyenDungMainPageState();
}

class _TuyenDungMainPageState extends State<TuyenDungMainPage> {
  final ExpandableController _filterHeaderController = ExpandableController();
  final PagingController<int, IDocument> _pagingController =
      PagingController(firstPageKey: 1);

  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _pagingController.addPageRequestListener((pageKey) {
        _fetchPage(pageKey);
      });
      _fetchPage(1);
    });
    _filterHeaderController.expanded = false;
  }

  void _changedDocument(String docTypeName, int id,
      Future<IDocument?> Function(int) loadOneCallback) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id && element.getType() == docTypeName;
    });

    if (item == null) return;

    loadOneCallback(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  final int _pageSize = 10;
  Future<void> _fetchPage(int pageKey) async {
    _pagingController.error = null;
    if (!mounted) return;

    try {
      if (_pagingController.itemList != null) {
        _pagingController.itemList!.clear();
      }
      _pagingController.appendLastPage(<IDocument>[]);
    } catch (error) {
      _pagingController.error = error;
    }
  }

  Future<void> _addDocuments(
      List<IDocument> sourceList,
      DocumentFetchPagedCallback loadDataCallback,
      ChangeStateCallback stateCallback) async {
    sourceList.clear();
    stateCallback.call(true);
    try {
      final dataList = await loadDataCallback(1, _pageSize, false, 2, '');
      sourceList.addAll(dataList);
      setState(() {
        _pagingController.appendLastPage(sourceList);
      });
    } finally {
      stateCallback.call(false);
    }
  }

  void _removeDocuments(List<IDocument> list, String docTypeName) {
    if (_pagingController.itemList == null) return;
    for (var item in list) {
      final IDocument found = _pagingController.itemList!.firstWhere(
          (element) =>
              item.getId() == element.getId() &&
              item.getType() == element.getType(),
          orElse: () => EmptyDocument());
      if (found is EmptyDocument) continue;
      _pagingController.itemList!.remove(found);
      // debugPrint('Item is found: $found');
    }

    _pagingController.itemList!
        .removeWhere((element) => element.getType() == docTypeName);
  }

  void _setStateOnMount(VoidCallback fn) {
    if (!mounted) {
      fn.call();
    } else {
      setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final screenSize = MediaQuery.of(context).size;
    return Consumer<TuyenDungPageModel>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("TUYỂN DỤNG"),
            elevation: 10,
            backgroundColor: Theme.of(context).colorScheme.background,
            actions: <Widget>[
              IconButton(
                icon: const Icon(LineIcons.filter),
                tooltip: 'Lọc dữ liệu',
                onPressed: () {
                  // handle the press
                  _filterHeaderController.toggle();
                },
              ),
            ],
          ),
          body: _buildFuntionGrid(context),
        );
      },
    );
  }

  Column _buildDataBodyView(Size screenSize, ThemeData theme) {
    return Column(
      children: [
        ExpandablePanel(
          controller: _filterHeaderController,
          collapsed: Container(),
          expanded: Container(
            margin: const EdgeInsets.only(
              left: 1,
              right: 1,
            ),
            constraints: BoxConstraints(minWidth: screenSize.width),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: theme.primaryColor)),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 7,
                right: 7,
              ),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 3.0,
                children: const [Text("No data found!")],
              ),
            ),
          ),
        ),
        Expanded(child: _buildRefreshList()),
      ],
    );
  }

  Widget _buildNoItemsFoundIndicator(BuildContext context) {
    final theme = Theme.of(context);
    final kyDuyetPageModel = context.read<TuyenDungPageModel>();
    if (kyDuyetPageModel.loadingKHCV || true) {
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 16.0, fontFamily: 'Horizon', color: theme.primaryColor),
          child: AnimatedTextKit(repeatForever: true, animatedTexts: [
            TypewriterAnimatedText('Đang tải dữ liệu...'),
            WavyAnimatedText('Đang tải dữ liệu...',
                speed: const Duration(milliseconds: 100)),
            TypewriterAnimatedText('Đang tải dữ liệu...'),
          ]),
        ),
      );
    }
    // ignore: dead_code
    return EmptyListWidget(onRefresh: () {
      _pagingController.refresh();
    });
  }

  Widget _buildNoMoreItemsIndicator(BuildContext context) {
    final kyDuyetPageModel = context.read<TuyenDungPageModel>();
    List<Widget> progressView = [];

    if (kyDuyetPageModel.loadingKHCV) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải kế hoạch công việc...',
      ));
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: (progressView.isNotEmpty)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: progressView,
            )
          : Center(
              child: Text(
              "Không còn dữ liệu để xem.",
              style: TextStyle(color: Theme.of(context).disabledColor),
            )),
    );
  }

  Widget _buildRefreshList() {
    return RefreshIndicator(
        onRefresh: () => Future.sync(
              () => _pagingController.refresh(),
            ),
        child: PagedListView<int, IDocument>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<IDocument>(
            itemBuilder: (context, item, index) {
              Widget newItem = const Text("Empty item");
              if (item.getType() == DataHelper.khcvName) {
                /*  newItem = GiayTamUngItem(
                  giaytamung: item as GiayTamUng,
                ); */
              } else {
                return const Text('Không có dữ liệu chi tiết');
              }
              return newItem;
            },
            newPageProgressIndicatorBuilder: (_) =>
                const Text("Đang tải dữ liệu."),
            noItemsFoundIndicatorBuilder: _buildNoItemsFoundIndicator,
            noMoreItemsIndicatorBuilder: _buildNoMoreItemsIndicator,
          ),
        ));
  }

  Widget _buildTabView(Size screenSize, ThemeData theme) {
    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person_2_fill),
          title: ("Phỏng vấn"),
          activeColorPrimary: theme.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person_add_solid),
          title: ("Đánh giá"),
          activeColorPrimary: theme.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person_crop_square_fill),
          title: ("Tuyển dụng"),
          activeColorPrimary: theme.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.doc_person_fill),
          title: ("Nhận việc"),
          activeColorPrimary: theme.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: navBarsItems(),
      // confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      // hideNavigationBarWhenKeyboardShows:
      //     true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      // decoration: NavBarDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   colorBehindNavBar: Colors.white,
      // ),
      // popAllScreensOnTapOfSelectedTab: true,
      // popActionScreens: PopActionScreensType.all,
      // itemAnimationProperties: const ItemAnimationProperties(
      //   // Navigation Bar's items animation properties.
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.ease,
      // ),
      // screenTransitionAnimation: const ScreenTransitionAnimation(
      //   // Screen transition animation on change of selected tab.
      //   animateTabTransition: true,
      //   curve: Curves.ease,
      //   duration: Duration(milliseconds: 200),
      // ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  Widget _buildFuntionGrid(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gridCount = size.width ~/ 100;
    final grid = GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      primary: true,
      padding: const EdgeInsets.all(11),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      crossAxisCount: gridCount,
      children: <Widget>[
        badges.Badge(
            showBadge: false,
            badgeContent: const Text(
              '',
              style: TextStyle(color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
            ),
            position: badges.BadgePosition.topStart(),
            child: FuntionItemWidget(
                onPressed: () {
                  MyNavigation.intentWithData(
                    ScreenRouteName.emptyFunctionPage,
                  );
                },
                text: "Đề xuất tuyển dụng",
                icon: Icons.people_rounded)),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Đánh giá phỏng vấn",
              icon: Icons.design_services),
        ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Đề xuất TGĐ phỏng vấn",
              icon: Icons.man_sharp),
        ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Ứng viên nhận việc",
              icon: Icons.mark_email_read_sharp),
        ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Bàn giao nhân sự",
              icon: Icons.hail_rounded),
        ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Đánh giá thử việc",
              icon: Icons.edit),
        ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Đánh giá cộng tác viên",
              icon: Icons.file_copy_sharp),
        ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Đánh giá tái ký hợp đồng",
              icon: Icons.contacts_rounded),
        ),
      ],
    );
    return grid;
    //grid.gridDelegate =
  }

  List<Widget> _buildScreens() {
    return [
      const Text('Đề xuất phỏng vấn'),
      const Text('Đánh giá phỏng vấn'),
      const Text('Đề xuất tuyển dụng'),
      const Text('Ứng viên nhận việc'),
    ];
  }

  @override
  void dispose() {
    // _giayTamUngSub.cancel();
    super.dispose();
  }

/*********************---------------------------
Đề xuất tuyển dụng
Đánh giá phỏng vấn
Đề xuất TGĐ phỏng vấn
Ứng viên nhận việc
Bàn giao nhân sự
Đánh giá thử việc
Đánh giá cộng tác viên
Đánh giá tái ký hợp đồng
-----------------------------------------------*/
}

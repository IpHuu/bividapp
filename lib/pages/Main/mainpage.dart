import 'package:bividpharma/model/dtos/connection_state.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/model/menu_model.dart';
import 'package:bividpharma/pages/system/about.dart';
import 'package:bividpharma/pages/system/empty_function_page.dart';
import 'package:bividpharma/pages/system/home_page.dart';
import 'package:bividpharma/pages/system/notify_list_page.dart';
import 'package:bividpharma/pages/system/profile_page.dart';
import 'package:bividpharma/pages/system/setting.dart';
import 'package:bividpharma/pages/tongquan/banhang/view/order_report_page.dart';
import 'package:bividpharma/pages/tongquan/loinhuan/views/loinhuan_page.dart';
import 'package:bividpharma/pages/tongquan/thau/view/bidding_report_page.dart';
import 'package:bividpharma/pages/tongquan/tonghop/view/tonghop_report_page.dart';
import 'package:bividpharma/pages/tongquan/tonkho/view/inventory_report_page.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PersistentTabController _tabController;
  // late AnimationController _progressBarController;
  late MainPageModel _mainModel;
  late bool _serverConnected = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController = PersistentTabController(initialIndex: 0);
  }

  @override
  void initState() {
    _mainModel = context.read<MainPageModel>();
    _mainModel.connectionStream.stream.listen(_onConnectionChanged);
    _serverConnected = _mainModel.myConnectionState.state == HubState.connected;

    // _progressBarController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 5),
    // )..addListener(() {
    //     setState(() {});
    //   });
    // _progressBarController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    // _progressBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const headerBackgroundUrl = "assets/logo-bivid.png";
    final itemMenuStyle = TextStyle(color: Theme.of(context).primaryColor);
    final messageCount = _mainModel.messageNumber;

    final menuList = <MenuModel>[
      const MenuModel(
          title: "Tổng quan",
          icon: Icons.dashboard,
          isRoot: true,
          tiles: [
            MenuModel(title: "Tổng quan công ty", route: EmptyFunctionPage()),
            MenuModel(title: "Tổng quan tổng hợp", route: TonghopReportView()),
            MenuModel(title: "Quản lý kinh doanh", route: EmptyFunctionPage()),
            MenuModel(title: "Tổng quan lợi nhuận", route: LoinhuanPage()),
            MenuModel(title: "Tổng quan công nợ", route: EmptyFunctionPage()),
            MenuModel(title: "Tổng quan marketing", route: EmptyFunctionPage()),
            MenuModel(title: "Tổng quan thầu", route: BiddingReportView()),
            MenuModel(title: "Tổng quan bán hàng", route: OrderReportView()),
            MenuModel(title: "Tổng quan tồn kho", route: InventoryReportView()),
          ]),
      const MenuModel(title: "Hộp Thư", icon: Icons.email, isRoot: true),
      const MenuModel(title: "Đơn hàng", icon: Icons.list, isRoot: true),
      const MenuModel(
          title: "Đơn hàng online",
          icon: Icons.list,
          isRoot: true,
          tiles: [
            MenuModel(title: "Văn bản nội bộ"),
            MenuModel(title: "Kế hoạch công việc")
          ]),
      const MenuModel(
        title: "Khách hàng",
        icon: Icons.person,
        isRoot: true,
      ),
      const MenuModel(
        title: "Công nợ",
        icon: Icons.card_giftcard,
        isRoot: true,
      ),
      const MenuModel(
          title: "Sản phẩm",
          icon: Icons.inventory,
          isRoot: true,
          tiles: [
            MenuModel(title: "Văn bản nội bộ"),
            MenuModel(title: "Kế hoạch công việc")
          ]),
      const MenuModel(
          title: "Phân quyền",
          icon: Icons.lock,
          isRoot: true,
          tiles: [
            MenuModel(title: "Văn bản nội bộ"),
            MenuModel(title: "Kế hoạch công việc")
          ]),
      const MenuModel(
          title: "Thiết lập",
          icon: Icons.settings,
          isRoot: true,
          tiles: [
            MenuModel(title: "Khai báo"),
            MenuModel(title: "Mục tiêu"),
          ])
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: _buildDrawer2(headerBackgroundUrl, itemMenuStyle, context,
              _mainModel, menuList)),

      appBar: AppBar(
        backgroundColor: UIHelper.BIVID_PRIMARY_COLOR,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Align(
          alignment: Alignment.center,
          child: Image.asset(
            headerBackgroundUrl,
            fit: BoxFit.contain,
            height: 48,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Xử lý khi bấm vào icon
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Xử lý khi bấm vào icon
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: const HomePage(),
      //bottomNavigationBar: const Text("bottomNavigationBar"),
    );
  }

  Set<MenuModel> selectedRootMenus = {};

  Widget buildTile(MenuModel menu, {int level = 0}) {
    bool isActive = menu.isRoot && selectedRootMenus.contains(menu);

    if (menu.tiles.isEmpty) {
      return Padding(
          padding: EdgeInsets.only(left: level * 16.0),
          child: ListTile(
            leading: menu.isRoot
                ? Icon(
                    menu.icon,
                    color: Theme.of(context).primaryColor,
                  )
                : null,
            title: Text(
              menu.title,
              style: TextStyle(
                color: Theme.of(context).primaryColor, // Active màu xanh
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              if (menu.route != null) {
                Navigator.pop(context);
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: menu.route!,
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }
            },
          ));
    } else {
      return Padding(
          padding: EdgeInsets.only(left: level * 16.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent, // Ẩn dòng gạch dưới khi mở
              expansionTileTheme: ExpansionTileThemeData(
                iconColor: Theme.of(context).primaryColor, // Màu icon mũi tên
              ),
            ),
            child: ExpansionTile(
              title: Text(
                menu.title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor, // Active màu xanh
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: menu.isRoot
                  ? Icon(
                      menu.icon,
                      color: Theme.of(context).primaryColor,
                    )
                  : null,
              children: menu.tiles
                  .map((tile) => buildTile(tile, level: level + 1))
                  .toList(),
              onExpansionChanged: (isExpanded) {
                setState(() {
                  // Cần setState để UI update
                  if (isExpanded) {
                    selectedRootMenus.add(menu);
                  } else {
                    selectedRootMenus.remove(menu);
                  }
                });
              },
            ),
          ));
    }
  }

  Column _buildDrawer2(String headerBackgroundUrl, TextStyle itemMenuStyle,
      BuildContext context, MainPageModel mainModel, List<MenuModel> menuList) {
    return Column(
      children: [
        Expanded(
            child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Image.asset(
                headerBackgroundUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ...menuList.map(buildTile),
                ],
              ),
            ),
          ],
        )),
        Container(
            alignment: Alignment.center,
            height: 60,
            child: const Column(
              children: [
                Text(
                  "Copyright @ 2025 by BIVID",
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
                Text(
                  "Version 1.0",
                  style: TextStyle(fontWeight: FontWeight.w100),
                )
              ],
            ))
      ],
    );
  }

  Column _buildDrawer(String headerBackgroundUrl, TextStyle itemMenuStyle,
      BuildContext context, MainPageModel mainModel, List<MenuModel> menuList) {
    return Column(
      children: [
        Expanded(
            child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Image.asset(
                headerBackgroundUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text("Riêng Tư", style: itemMenuStyle),
                    leading: const Icon(Icons.person),
                    children: [
                      ListTile(
                        title: Text('Hồ sơ của tôi', style: itemMenuStyle),
                        onTap: () {
                          Navigator.pop(context);
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const ProfilePage(),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                      ),
                      ListTile(
                        title: Text('Thiết lập', style: itemMenuStyle),
                        onTap: () {
                          Navigator.pop(context);
                          _tabController.index = (1);
                          _tabController.jumpToTab(1);
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("Biểu mẫu trình ký"),
                    leading: const Icon(Icons.edit),
                    children: [
                      ListTile(
                        title: Text('Điều khoản sử dụng', style: itemMenuStyle),
                        style: ListTileStyle.list,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 20.0),
                        onTap: () {
                          Navigator.pop(context);
                          _launchURL(
                              'Điều khoản sử dụng', ApiCoreService.termsURL);
                        },
                      ),
                      ListTile(
                        title: Text('Chính sách bảo mật', style: itemMenuStyle),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 20.0),
                        onTap: () {
                          Navigator.pop(context);
                          _launchURL(
                              'Chính sách bảo mật', ApiCoreService.policyURL);
                        },
                      ),
                      ListTile(
                        title: Text('Giới thiệu', style: itemMenuStyle),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 20.0),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const AboutePage()),
                          );
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text('Đăng xuất', style: itemMenuStyle),
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      mainModel.signOut();
                      MyNavigation.intentWithDataReplaced(
                          ScreenRouteName.loginPage);
                    },
                  ),
                ],
              ),
            )),
          ],
        )),
        Container(
            alignment: Alignment.center,
            height: 60,
            child: const Column(
              children: [
                Text(
                  "Copyright @ 2022 by BIVID",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Version 1.0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ))
      ],
    );
  }

  void _launchURL(String title, String url) async {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: await _buildHtmlView(
          context, title, url), //_buildWebView(context, title, url),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  Future<Widget> _buildHtmlView(
      BuildContext context, String title, String url) async {
    final htmlData = await ApiCoreService.loadHtml(url);

    if (!mounted) return const Text('Phần mềm quá tải, vui lòng thử lại.');
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 10,
        backgroundColor: theme.primaryColor,
      ),
      body: SafeArea(
          child: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HtmlWidget(htmlData),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _onConnectionChanged(MyConnectionState state) {
    if (!mounted) return;
    setState(() {
      _serverConnected = (state.state == HubState.connected);
    });
  }

  // ignore: body_might_complete_normally_nullable
  // PreferredSize? _buildBottomBar() {
  //   if (_serverConnected) {
  //     return null;
  //   }
  //   /*
  //   return PreferredSize(
  //       preferredSize: const Size.fromHeight(3.0),
  //       child: Container(
  //         padding: const EdgeInsets.only(
  //           top: 0,
  //           bottom: 0,
  //         ),
  //         color: Colors.white,
  //         height: 3.0,
  //         child: LinearProgressIndicator(
  //           value: _progressBarController.value,
  //           color: UIHelper.BIVID_WARNING_COLOR,
  //           semanticsLabel: 'Connecting Bivid Server...',
  //         ),
  //       ));
  //   */
  // }

  Widget _buildMainView() {
    final tabView = PersistentTabView(
      context,
      confineToSafeArea: true,
      controller: _tabController,
      screens: _buildScreens(),
      backgroundColor: CupertinoColors.white, // Default is Colors.white.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      hideNavigationBarWhenKeyboardAppears:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(5.0),
        colorBehindNavBar: CupertinoColors.white,
      ),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.linear,
          duration: Duration(milliseconds: 100),
        ),
      ),

      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
      navBarHeight: kBottomNavigationBarHeight,
    );

    return tabView;
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Trang chủ"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.envelope),
        title: ("Thông báo"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Thiết lập"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_fill),
        title: ("Hồ sơ"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      // PersistentBottomNavBarItem(
      //   icon: const Icon(CupertinoIcons.arrow_up_bin_fill),
      //   title: ("TEST"),
      //   activeColorPrimary: Theme.of(context).primaryColor,
      //   inactiveColorPrimary: CupertinoColors.systemGrey,
      // ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      NotifyListPage(title: 'Thông báo', showTitle: false),
      const SettingPage(),
      const ProfilePage(
        showTitle: false,
      ),
      // const DocumentFileAttachPage(),
    ];
  }
}

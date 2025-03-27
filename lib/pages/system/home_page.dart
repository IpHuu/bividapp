import 'package:badges/badges.dart' as badges;
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/funtion_item_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> bividImages = [
    "assets/01_universal.jpg",
    "assets/02_universal.jpg",
    "assets/03_universal.jpg",
    "assets/04_universal.jpg",
    "assets/05_universal.jpg",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code, unused_local_variable
    final bool isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
    //final isUsingDevUI = UIHelper.isUsingDevUI(context);
    final model = context.watch<MainPageModel>();
    final isUsingDevUI = model.userSettings.usingDevelopingUI;
    // return const Text("Home View");
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 1,
        ),
        constraints: BoxConstraints(minHeight: size.height - 200),
        color: Theme.of(context).primaryColor.withOpacity(0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _createBoxFunction(
              'Trình ký hồ sơ',
              _buildFuntionGrid(context),
              Icons.file_copy_rounded,
            ),
            _createBoxFunction(
              'Riêng tư',
              _buildPrivateInfoGrid(context),
              Icons.file_copy_rounded,
            ),
            isUsingDevUI
                ? _createBoxFunction(
                    'Bán hàng',
                    _buildSalesFuntionGrid(context),
                    Icons.business_center_rounded)
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _createBoxFunction(String title, Widget child, IconData titleIcon) {
    var borderColor = Colors.black12;
    final borderBox = Border(
        top: BorderSide(
          color: borderColor,
          width: 1,
        ),
        bottom: BorderSide(
          color: borderColor,
        ));
    final boxDecord = BoxDecoration(
        border: borderBox,
        gradient: UIHelper.lineTopDownWhiteBackground(context));

    final size = MediaQuery.of(context).size;
    final functionBoxHeight = double.parse((size.height ~/ 3).toString());

    return Container(
      margin: const EdgeInsets.only(
        top: 3,
      ),
      constraints: BoxConstraints(
        minHeight: functionBoxHeight,
        maxHeight: functionBoxHeight * 2,
      ),
      decoration: boxDecord,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              gradient: UIHelper.linearPrimaryBackground(context),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(titleIcon, size: 18, color: Colors.white),
                    baseline: TextBaseline.alphabetic,
                  ),
                  TextSpan(
                    text: ' $title',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          child,
        ],
      ),
    );
  }

  Widget _buildFuntionGrid(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gridCount = size.width ~/ 100;
    final grid = GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      primary: true,
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      shrinkWrap: true,
      crossAxisCount: gridCount,
      children: <Widget>[
        badges.Badge(
            showBadge: false,
            badgeContent: const Text(
              '',
              style: TextStyle(color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
            ),
            position: badges.BadgePosition.topStart(),
            child: FuntionItemWidget(
                onPressed: () {
                  MyNavigation.intentWithData(
                    ScreenRouteName.newDocumentPage,
                  );
                },
                text: "Hồ sơ chờ duyệt",
                icon: Icons.note_outlined)),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.boPhanThietKeListPage,
                );
              },
              text: "Mẫu thiết kế",
              icon: Icons.design_services),
        ),
        // Badge(
        //   showBadge: false,
        //   child: FuntionItemWidget(
        //       onPressed: () {
        //         MyNavigation.intentWithData(
        //           ScreenRouteName.boPhanTuyenDungMainPage,
        //         );
        //       },
        //       text: "Tuyển dụng",
        //       icon: Icons.emoji_people),
        // ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.traCuuHoSoPage,
                );
              },
              text: "Tra cứu hồ sơ",
              icon: Icons.manage_search),
        ),
      ],
    );
    return grid;
    //grid.gridDelegate =
  }

  Widget _buildPrivateInfoGrid(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gridCount = size.width ~/ 100;
    final grid = GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      primary: true,
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      shrinkWrap: true,
      crossAxisCount: gridCount,
      children: <Widget>[
        badges.Badge(
            showBadge: false,
            badgeStyle: const badges.BadgeStyle(
              badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
            ),
            badgeContent: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Dev',
                style: TextStyle(
                    fontSize: 8, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
              ),
            ),
            position: badges.BadgePosition.topStart(),
            child: FuntionItemWidget(
                onPressed: () {
                  MyNavigation.intentWithData(
                    ScreenRouteName.bangChamCongPage,
                  );
                },
                text: "Bảng công",
                icon: Icons.assignment)),
        badges.Badge(
            showBadge: false,
            badgeStyle: const badges.BadgeStyle(
              badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
            ),
            position: badges.BadgePosition.topStart(),
            badgeContent: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Dev',
                style: TextStyle(
                    fontSize: 8, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
              ),
            ),
            child: FuntionItemWidget(
                onPressed: () {
                  MyNavigation.intentWithData(
                    ScreenRouteName.traCuuDienThoaiPage,
                  );
                },
                text: "Điện thoại nội bộ",
                icon: Icons.phone_outlined)),
      ],
    );

    return grid;
  }

  Widget _buildSalesFuntionGrid(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gridCount = size.width ~/ 100;
    final grid = GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      primary: true,
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      shrinkWrap: true,
      crossAxisCount: gridCount,
      children: <Widget>[
        badges.Badge(
            showBadge: true,
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
            ),
            position: badges.BadgePosition.topEnd(top: 5, end: 40),
            badgeContent: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                '1',
                style: TextStyle(
                    fontSize: 8, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
              ),
            ),
            child: FuntionItemWidget(
                onPressed: () {
                  MyNavigation.intentWithData(
                    ScreenRouteName.ordersView,
                  );
                },
                text: "Đơn hàng",
                icon: Icons.shopping_bag)),
        badges.Badge(
            showBadge: true,
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
            ),
            position: badges.BadgePosition.topEnd(top: 5, end: 40),
            badgeContent: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                '1',
                style: TextStyle(
                    fontSize: 8, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
              ),
            ),
            child: FuntionItemWidget(
                onPressed: () {
                  MyNavigation.intentWithData(
                    ScreenRouteName.bookingOrderPage,
                  );
                },
                text: "Đặt hàng",
                icon: Icons.shopping_bag)),
        badges.Badge(
          showBadge: false,
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.red,
          ),
          position: badges.BadgePosition.topEnd(top: 5, end: 30),
          badgeContent: const Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              '99+',
              style: TextStyle(
                  fontSize: 8, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
            ),
          ),
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Khách hàng",
              icon: Icons.co_present_outlined),
        ),
        badges.Badge(
          showBadge: false,
          badgeStyle: const badges.BadgeStyle(
            badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
          ),
          position: badges.BadgePosition.topStart(),
          badgeContent: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              'Dev',
              style: TextStyle(
                  fontSize: 8, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
            ),
          ),
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Báo cáo doanh số",
              icon: Icons.bar_chart),
        ),
        badges.Badge(
          showBadge: false,
          badgeStyle: const badges.BadgeStyle(
            badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
          ),
          position: badges.BadgePosition.topStart(),
          badgeContent: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              'Dev',
              style: TextStyle(
                  fontSize: 8, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
            ),
          ),
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.emptyFunctionPage,
                );
              },
              text: "Báo cáo sản lượng",
              icon: Icons.pie_chart),
        ),
      ],
    );

    return grid;
    //grid.gridDelegate =
  }
}

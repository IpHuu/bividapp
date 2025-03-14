import 'package:bividpharma/model/kyduyet_online_page_model.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/funtion_item_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class TraCuuHoSoPage extends StatefulWidget {
  const TraCuuHoSoPage({Key? key}) : super(key: key);

  @override
  State<TraCuuHoSoPage> createState() => _TraCuuHoSoPageState();
}

class _TraCuuHoSoPageState extends State<TraCuuHoSoPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final bool isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    final size = MediaQuery.of(context).size;
    final conBody = Container(
      padding: const EdgeInsets.all(0),
      constraints: BoxConstraints(minHeight: size.height - 30),
      decoration:
          BoxDecoration(gradient: UIHelper.linearGradientBackground(context)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Hành chính',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          _buildHanhChinhGrid(context),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Thanh quyết toán',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildThanhQuyetToanGrid(context),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Kế hoạch công việc & công tác',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          _buildLichCongTacGrid(context),
        ],
      ),
    );
    return Consumer<KyDuyetOnlinePageModel>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
            title: const Text(
              "TRA CỨU HỒ SƠ",
              style: TextStyle(color: Colors.white),
            ),
            elevation: 10,
            backgroundColor: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.white)),
        body: SingleChildScrollView(child: conBody),
      );
    });
  }

  Widget _buildHanhChinhGrid(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gridCount = size.width ~/ 100;
    // final model = context.watch<MainPageModel>();
    // final isUsingDevUI = model.userSettings.usingDevelopingUI;

    final functions = <Widget>[];
    functions.addAll(<Widget>[
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
                  ScreenRouteName.giayXinPhepPage,
                );
              },
              text: "Giấy xin phép",
              icon: Icons.note_outlined)),
      badges.Badge(
        showBadge: false,
        child: FuntionItemWidget(
            onPressed: () {
              MyNavigation.intentWithData(
                ScreenRouteName.giayRaCongPage,
              );
            },
            text: "Giấy ra cổng",
            icon: Icons.note_outlined),
      ),
      badges.Badge(
        showBadge: false,
        badgeContent: const Text(
          'Dev',
          style: TextStyle(
              fontSize: 9, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
        ),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
        ),
        position: badges.BadgePosition.topStart(),
        child: FuntionItemWidget(
            onPressed: () {
              MyNavigation.intentWithData(
                ScreenRouteName.deNghiCapSimPage,
              );
            },
            text: "Đề nghị cấp SIM",
            icon: Icons.note_outlined),
      ),
      badges.Badge(
        showBadge: false,
        badgeContent: const Text(
          'Dev',
          style: TextStyle(
              fontSize: 9, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
        ),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
        ),
        position: badges.BadgePosition.topStart(),
        child: FuntionItemWidget(
            onPressed: () {
              MyNavigation.intentWithData(
                ScreenRouteName.deNghiMuaVppPage,
              );
            },
            text: "Đề nghị mua VPP",
            icon: Icons.note_outlined),
      ),
      badges.Badge(
        showBadge: false,
        badgeContent: const Text(
          'Dev',
          style: TextStyle(fontSize: 9, color: Color.fromARGB(255, 121, 5, 5)),
        ),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
        ),
        position: badges.BadgePosition.topStart(),
        child: FuntionItemWidget(
            onPressed: () {
              MyNavigation.intentWithData(
                ScreenRouteName.deNghiCapVppPage,
              );
            },
            text: "Đề nghị cấp VPP",
            icon: Icons.note_outlined),
      )
    ]);

    final grid = GridView.count(
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: gridCount,
      children: functions,
    );
    return grid;
  }

  Widget _buildThanhQuyetToanGrid(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gridCount = size.width ~/ 100;

    final grid = GridView.count(
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: gridCount,
      children: <Widget>[
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.phieuTamUngPage,
                );
              },
              text: "Phiếu tạm ứng",
              icon: Icons.note_outlined),
        ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.phieuTQTPage,
                );
              },
              text: "Thanh quyết toán",
              icon: Icons.note_outlined),
        ),
        badges.Badge(
          showBadge: false,
          child: FuntionItemWidget(
              onPressed: () {
                MyNavigation.intentWithData(
                  ScreenRouteName.phieuDeXuatMuaHangPage,
                );
              },
              text: "Đề xuất mua hàng",
              icon: Icons.note_outlined),
        ),
      ],
    );
    return grid;
  }

  Widget _buildLichCongTacGrid(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gridCount = size.width ~/ 100;
    final model = context.watch<MainPageModel>();
    final isUsingDevUI = model.userSettings.usingDevelopingUI;

    final listDevWidgets = <Widget>[];
    final listWidgets = <Widget>[];
    listWidgets.add(badges.Badge(
      showBadge: false,
      child: FuntionItemWidget(
          onPressed: () {
            MyNavigation.intentWithData(
              ScreenRouteName.phieuKHCVPage,
            );
          },
          text: "Kế hoạch công việc",
          icon: Icons.note_outlined),
    ));
    listWidgets.add(badges.Badge(
      showBadge: false,
      badgeStyle: const badges.BadgeStyle(
        badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
      ),
      position: badges.BadgePosition.topStart(),
      child: FuntionItemWidget(
          onPressed: () {
            MyNavigation.intentWithData(
              ScreenRouteName.lenhCongTacPage,
            );
          },
          text: "Lệnh công tác",
          icon: Icons.note_outlined),
    ));
    listWidgets.add(badges.Badge(
      showBadge: false,
      badgeStyle: const badges.BadgeStyle(
        badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
      ),
      position: badges.BadgePosition.topStart(),
      child: FuntionItemWidget(
          onPressed: () {
            MyNavigation.intentWithData(
              ScreenRouteName.keHoachCongTacPage,
            );
          },
          text: "Kế hoạch công tác",
          icon: Icons.note_outlined),
    ));
    listWidgets.add(badges.Badge(
      showBadge: false,
      badgeContent: const Text(
        'Dev',
        style: TextStyle(
            fontSize: 9, color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR),
      ),
      badgeStyle: const badges.BadgeStyle(
        badgeColor: UIHelper.BIVID_PRIMARY_COLOR,
      ),
      position: badges.BadgePosition.topStart(),
      child: FuntionItemWidget(
          onPressed: () {
            MyNavigation.intentWithData(
              ScreenRouteName.chiPhiCongTacPage,
            );
          },
          text: "Chi phí công tác",
          icon: Icons.note_outlined),
    ));

    if (isUsingDevUI) {
      listWidgets.addAll(listDevWidgets);
    }

    final grid = GridView.count(
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: gridCount,
      children: listWidgets,
    );
    return grid;
  }
}

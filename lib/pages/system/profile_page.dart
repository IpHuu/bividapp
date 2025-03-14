import 'dart:async';
import 'package:bividpharma/model/dtos/user_info.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/system/setting.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  final bool showTitle;

  const ProfilePage({Key? key, this.showTitle = true}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserInfo _userInfo = UserInfo.fromEmpty();
  late String _userName = "";
  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final model = context.read<MainPageModel>();
    _userName = model.loginedUser.userName;
    final userInfo =
        await ApiCoreService.loadUserInfo(model.loginedUser.userName);
    if (userInfo != null) {
      if (mounted) {
        _userInfo = UserInfo.copyFrom(userInfo);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: widget.showTitle
          ? AppBar(
              title: const Text(
                "Hồ sơ của tôi",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SettingPage()),
                    ); // Xử lý khi bấm vào icon
                  },
                ),
              ],
            )
          : null,
      body: SingleChildScrollView(
        child: _buildBody(width, height),
      ),
      backgroundColor: UIHelper.BIVID_WHITE_BACKGROUND_COLOR.withOpacity(0.5),
    );
  }

  Widget _buildBody(double width, double height) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    late String imgUrl = "assets/undraw_male_avatar_323b.png";
    if (_userName == "BINH.NGODUC") {
      imgUrl = "assets/img_ngoducbinh.png";
    }
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenSize.height),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              /*CircleAvatar(               
                backgroundColor: Colors.white,
                radius: 60.0,
                  child: CircleAvatar(
                  backgroundImage: AssetImage('images/darth_vader.jpg'),
                  radius: 50.0,
                  ),
              ),*/
              Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: Image.asset(imgUrl).image,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(70.0)),
                  border: Border.all(
                    color: theme.primaryColor,
                    width: 1.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Flex(
                        direction: Axis.vertical,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${_userInfo.tenNhanvien}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width / 15,
                                color: theme.primaryColor),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: width / 8, right: width / 8),
                            child: Text(
                              '${_userInfo.tenCty}',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: width / 25,
                                  color: theme.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Divider(
                            height: 20,
                            color: theme.primaryColor,
                          ),
                          ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  Icons.business_sharp,
                                  color: theme.primaryColor,
                                ),
                                title: const Text(
                                  'Bộ phận',
                                  style: TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                  ),
                                ),
                                trailing: Text(
                                  _userInfo.tenBophan ?? "",
                                  style: const TextStyle(
                                      color: UIHelper.BIVID_BLACK_TEXT_COLOR),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.work,
                                  color: theme.primaryColor,
                                ),
                                title: const Text(
                                  'Phòng ban',
                                  style: TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                  ),
                                ),
                                trailing: Text(
                                  _userInfo.tenPhongban ?? "",
                                  style: const TextStyle(
                                      color: UIHelper.BIVID_BLACK_TEXT_COLOR),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.point_of_sale,
                                  color: theme.primaryColor,
                                ),
                                title: const Text(
                                  'Chức vụ',
                                  style: TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                  ),
                                ),
                                trailing: Text(
                                  _userInfo.tenChucvu ?? "",
                                  style: const TextStyle(
                                      color: UIHelper.BIVID_BLACK_TEXT_COLOR),
                                ),
                              ),
                              Divider(
                                color: theme.primaryColor,
                              ),
                              ListTile(
                                title: const Text(
                                  'Sổ BHXH',
                                  style: TextStyle(
                                      color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  _userInfo.soBaoHiem ?? "",
                                  style: const TextStyle(
                                      color: UIHelper.BIVID_BLACK_TEXT_COLOR),
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                  'Mã số thuế',
                                  style: TextStyle(
                                      color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  _userInfo.maSoThue ?? "",
                                  style: const TextStyle(
                                      color: UIHelper.BIVID_BLACK_TEXT_COLOR),
                                ),
                              ),
                              ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Tài khoản NH',
                                      style: TextStyle(
                                          color:
                                              UIHelper.BIVID_BLACK_TEXT_COLOR,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "${_userInfo.soTaiKhoan ?? ""} - ${_userInfo.tenNganHang}",
                                          softWrap: true,
                                          style: const TextStyle(
                                              color: UIHelper
                                                  .BIVID_BLACK_TEXT_COLOR),
                                          textWidthBasis:
                                              TextWidthBasis.longestLine,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                isThreeLine: false,
                              ),
                            ],
                          ),
                        ]),
                  )),
            ],
          ),
        )
      ],
    );
  }

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}

import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/model/themenotifier.dart';
import 'package:bividpharma/pages/Auth/view_model/login_viewmodel.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:version/version.dart' as appversion;

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late BividThemeEnum? _bividTheme = BividThemeEnum.bivid;
  late bool _isSwitched;
  late bool _isDevelopingUI = false;

  late String _apkVersion = '';
  late String _apkNewVersion = '';
  late String _serviceButtonText = 'Khởi chạy';
  @override
  void initState() {
    super.initState();
    _isSwitched = false;

    final model = context.read<MainPageModel>();
    model.readSettings().then((value) {
      setState(() {
        _isSwitched = model.userSettings.fingerEnabled;
        _isDevelopingUI = model.userSettings.usingDevelopingUI;
        _bividTheme = BividThemeEnum.values[model.userSettings.themeColor];
      });
    });
    ApiCoreService.appVersion('android').then((value) async {
      try {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String version = packageInfo.version;

        final currentVersion = appversion.Version.parse(version);
        final lastestVersion = appversion.Version.parse(value);

        //String buildNumber = packageInfo.buildNumber;
        if (currentVersion < lastestVersion) {
          debugPrint(
              'currentVersion: ${currentVersion.toString()} is out of date.');
          setState(() {
            _apkNewVersion = value;
          });
        }
        setState(() {
          _apkVersion = version;
        });
      } catch (_) {
        //
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
      backgroundColor: Theme.of(context).primaryColor,
      minimumSize: const Size(120, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thiết lập",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(shrinkWrap: true, children: [
          ListTile(
            title: const Text("Sử dụng vân tay"),
            leading: Icon(
              Icons.fingerprint,
              color: Theme.of(context).primaryColor,
            ),
            trailing: Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                  final model = context.read<MainPageModel>();
                  if (_isSwitched) {
                    model.userSettings.fingerSecretCode =
                        model.userSettings.cachedSecretCode;
                    model.userSettings.fingerUser =
                        model.userSettings.cachedUserCode;
                  }
                  model.userSettings.fingerEnabled = value;
                  model.saveSettings();
                });
              },
              activeTrackColor: Theme.of(context).colorScheme.secondary,
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
          const Divider(
            color: Colors.black26,
            thickness: 1,
          ),
          ListTile(
            title: const Text("Giao diện đang phát triển"),
            leading: Icon(
              Icons.precision_manufacturing_outlined,
              color: Theme.of(context).primaryColor,
            ),
            trailing: Switch(
              value: _isDevelopingUI,
              onChanged: (value) {
                setState(() {
                  _isDevelopingUI = value;
                  final model = context.read<MainPageModel>();
                  model.userSettings.usingDevelopingUI = value;
                  model.saveSettings();
                });
              },
              activeTrackColor: Theme.of(context).colorScheme.secondary,
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
          const Divider(
            color: Colors.black26,
            thickness: 1,
          ),
          ListTile(
            title: const Text(
              "Màu sắc",
            ),
            leading: Icon(
              Icons.colorize,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [
                RadioListTile<BividThemeEnum>(
                  title: const Text('Mẫu màu 1',
                      style: TextStyle(color: UIHelper.BIVID_PRIMARY_COLOR)),
                  subtitle: Container(
                      height: 32, color: UIHelper.BIVID_PRIMARY_COLOR),
                  value: BividThemeEnum.bivid,
                  groupValue: _bividTheme,
                  onChanged: (BividThemeEnum? value) {
                    setState(() {
                      final themeNotifier =
                          Provider.of<ThemeNotifier>(context, listen: false);
                      themeNotifier.myTheme = UIHelper.defaultTheme;
                      _bividTheme = value;
                    });
                  },
                ),
                RadioListTile<BividThemeEnum>(
                  title: const Text(
                    'Mẫu màu 2',
                    style:
                        TextStyle(color: UIHelper.BIVID_PRIMARY_COLOR_HUMANA),
                  ),
                  subtitle: Container(
                      height: 32, color: UIHelper.BIVID_PRIMARY_COLOR_HUMANA),
                  value: BividThemeEnum.humana,
                  groupValue: _bividTheme,
                  onChanged: (BividThemeEnum? value) {
                    setState(() {
                      final themeNotifier =
                          Provider.of<ThemeNotifier>(context, listen: false);
                      themeNotifier.myTheme = UIHelper.humanaTheme;
                      _bividTheme = value;
                    });
                  },
                ),
              ],
            ),
          ),
          // _backgroundSettingView(context, raisedButtonStyle),
          const Divider(
            color: Colors.black26,
            thickness: 1,
          ),
          Center(
            child: ListTile(
              title: Text(
                "Phiên bản hiện tại $_apkVersion",
              ),
              leading: Icon(
                Icons.info_outline,
                color: Theme.of(context).primaryColor,
              ),
              subtitle: _apkNewVersion.isEmpty
                  ? Text(
                      'Bạn đang sử dụng phiên bản mới nhất',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 11),
                    )
                  : Text('Phiên bản mới $_apkNewVersion',
                      style: const TextStyle(color: Colors.red)),
            ),
          ),
          Center(child: Consumer<LoginViewModel>(builder: (context, vm, child) {
            return ListTile(
                title: Text(
                  "Đăng xuất",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                  vm.logout();
                  MyNavigation.intentWithDataReplaced(
                      ScreenRouteName.loginPage);
                });
          })),
          _buildNewVersion(context, raisedButtonStyle),
        ]),
      ),
    );
  }

  // ignore: unused_element
  ListTile _backgroundSettingView(
      BuildContext context, ButtonStyle raisedButtonStyle) {
    return ListTile(
      title: const Text(
        "Dịch vụ nền",
      ),
      subtitle: const Text(
        'Cho phép nhận thông báo từ máy chủ khi không mở App.',
        style: TextStyle(
            fontSize: 10, fontStyle: FontStyle.italic, color: Colors.black),
      ),
      leading: Icon(
        Icons.miscellaneous_services,
        color: Theme.of(context).primaryColor,
      ),
      trailing: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () async {
          final service = FlutterBackgroundService();
          var isRunning = await service.isRunning();
          if (isRunning) {
            service.invoke("stopService");
          } else {
            FlutterBackgroundService().invoke("setAsBackground");
            await service.startService();
          }
          isRunning = await service.isRunning();
          if (isRunning) {
            setState(() {
              _serviceButtonText = 'Tạm ngừng';
            });
          } else {
            setState(() {
              _serviceButtonText = 'Khởi chạy';
            });
          }
          setState(() {});
        },
        child: Text(_serviceButtonText),
      ),
    );
  }

  Widget _buildNewVersion(BuildContext context, ButtonStyle raisedButtonStyle) {
    return const SizedBox(
      height: 1.0,
    );
/* 
    if (_apkNewVersion.isEmpty) {
      return Container();
    }
    return Row(
      children: [
        const Spacer(),
        ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () async {
            final String verName = _apkNewVersion.replaceAll('.', '_');
            final String fileName = 'bivid_pharma_app_ver$verName.apk';
            MyNavigation.intentWithData(ScreenRouteName.upgraderPage,
                arguments: fileName);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.download,
                color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
              ),
              Text(
                "Cập nhật",
                style: TextStyle(color: UIHelper.BIVID_WHITE_TEXT_COLOR),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    ); */
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/dialog/dialog_viewmodel.dart';
import 'package:bividpharma/common/my_device_info.dart';
import 'package:bividpharma/model/dtos/base/auth_response.dart';
import 'package:bividpharma/model/dtos/common/login_param.dart';
import 'package:bividpharma/model/dtos/setting_app/setting_app.dart';
import 'package:bividpharma/model/dtos/usertoken.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/Auth/view_model/login_viewmodel.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

import '../../../common/dialog/dialog_listener.dart';
import '../../../model/dtos/auth/m_token.dart';
import '../../../services/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late Color textColor = UIHelper.BIVID_PRIMARY_COLOR;

  final bool _rememberMe = false;
  final String _loginErrorText = "";
  bool _showPassword = true;
  late final bool _isProgressing = false;
  late final bool _isShowFinger = true;

  @override
  void initState() {
    super.initState();
    // _aniController = AnimationController(
    //   duration: const Duration(milliseconds: 2000),
    //   vsync: this,
    // );
    // _aniController.repeat(reverse: true);

    // _aniColor = ColorTween(
    //   begin: Colors.grey,
    //   end: Colors.blue,
    // ).animate(_aniController);
    // _aniColor.addListener(() {
    //   setState(() {});
    // });

    // final model = context.read<MainPageModel>();
    // model.readSettings().then((value) {
    //   emailController.text = model.userSettings.cachedUserCode;
    //   setState(() {
    //     _rememberMe = model.userSettings.rememberMe;
    //     _isShowFinger = model.userSettings.fingerEnabled;
    //     if (!_rememberMe) {
    //       emailController.text = "";
    //     }
    //   });
    // });
  }

  @override
  void dispose() {
    // _aniController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final viewModel = context.watch<LoginViewModel>();
    if (viewModel.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.scale,
          title: "Thông báo",
          titleTextStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          desc: viewModel.errorMessage,
          descTextStyle: const TextStyle(color: Colors.red, fontSize: 16),
          btnOkColor: Theme.of(context).primaryColor,
          btnOkOnPress: () {
            viewModel.closeDialog();
          },
        ).show();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    textColor = theme.primaryColor;
    return Scaffold(
      backgroundColor: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
            child: Column(
              children: [
                const Spacer(),
                Center(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          _logo(size.height / 8, size.height / 8),
                          const SizedBox(
                            height: 16,
                          ),
                          _richText(23.12),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Hãy cung cấp thông tin đăng nhập để bắt đầu',
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ]),
                ),
                Center(
                  child: SizedBox(
                    width: size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Column(
                              children: [
                                _emailTextField(size),
                                const SizedBox(
                                  height: 4,
                                ),
                                _passwordTextField(
                                    Size(size.width, size.height)),
                                // _buildPasswordWithFinger(
                                //     size, context, _isShowFinger),
                                const SizedBox(
                                  height: 4,
                                ),
                                _buildRemember(size),
                                // _buildLoginError(),
                                _signInButton2(size),
                                const SizedBox(
                                  height: 20,
                                ),
                                _buildLocalAuth(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _buildFooter(size),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocalAuth() {
    return Consumer<LoginViewModel>(builder: (context, vm, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Đăng nhập bằng vân tay hoặc khuôn mặt"),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 60, // Kích thước hình tròn
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .highlightColor, // Màu nền có độ trong suốt
                shape: BoxShape.circle, // Hình dạng tròn
              ),
              child: IconButton(
                icon: Image.asset(
                  "assets/icon/face-id.png",
                  height: 40,
                  width: 40,
                ),
                // icon: Icon(
                //   Icons.fingerprint,
                //   size: 40,
                //   color: Theme.of(context).primaryColor,
                // ),
                onPressed: () async {
                  bool isLogin = await vm.loginWithBiometrics();
                  if (isLogin) {
                    MyNavigation.intentWithDataReplaced(
                      ScreenRouteName.mainPage,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildPasswordWithFinger(
      Size size, BuildContext context, bool showFinger) {
    if (showFinger) {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          child: _passwordTextField(Size(size.width - 100, size.height)),
        ),
        Container(
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: UIHelper.BIVID_THIRD_COLOR,
          ),
          child: SizedBox(
            width: 40,
            child: Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                icon: Icon(
                  Icons.fingerprint,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ]);
    } else {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          child: _passwordTextField(Size(size.width, size.height)),
        ),
      ]);
    }
  }

  Widget _logo(double height_, double width_) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Image.asset(
        'assets/icon/icon-bivid.png',
      ),
    );
  }

  Widget _richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: 23.12,
          color: Colors.white,
          letterSpacing: 1.999999953855673,
        ),
        children: [
          const TextSpan(
            text: 'BIVID',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.red,
            ),
          ),
          TextSpan(
            text: 'Pharma',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      //height: size.height / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: UIHelper.BIVID_THIRD_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //mail icon
            Icon(
              Icons.mail_rounded,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 16,
            ),

            //divider svg
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
            ),
            const SizedBox(
              width: 16,
            ),

            //email address textField
            Expanded(
                child: Consumer<LoginViewModel>(builder: (context, vm, child) {
              return TextField(
                controller: vm.emailController,
                maxLines: 1,
                cursorColor: Colors.white70,
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    hintText: 'Mã đăng nhập',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none),
              );
            })),
          ],
        ),
      ),
    );
  }

  Widget _passwordTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      //height: size.height / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: UIHelper.BIVID_THIRD_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //lock logo here
            Icon(
              Icons.lock,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 16,
            ),
            //divider svg
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
            ),
            const SizedBox(
              width: 16,
            ),

            Expanded(
                child: Consumer<LoginViewModel>(builder: (context, vm, child) {
              return TextField(
                controller: vm.passController,
                maxLines: 1,
                cursorColor: Colors.white70,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _showPassword,
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: _buildPasswordButton(),
                    border: InputBorder.none),
              );
            })),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordButton() {
    if (_showPassword) {
      return IconButton(
        icon: Icon(Icons.visibility, color: Theme.of(context).primaryColor),
        tooltip: 'Hiển thị mật khẩu',
        onPressed: () {
          setState(() {
            _showPassword = !_showPassword;
          });
        },
      );
    } else {
      return IconButton(
        icon: const Icon(
          Icons.visibility_off,
          color: UIHelper.BIVID_WHITE_TEXT_COLOR,
        ),
        tooltip: 'Ẩn mật khẩu',
        onPressed: () {
          setState(() {
            _showPassword = !_showPassword;
          });
        },
      );
    }
  }

  Widget _buildRemember(Size size) {
    return Consumer<LoginViewModel>(builder: (context, vm, child) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Checkbox(
                value: vm.isRememberMe,
                checkColor: UIHelper.BIVID_WHITE_TEXT_COLOR,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (newValue) {
                  vm.setRememberMe(newValue!);
                }),
            Text(
              'Lưu thông tin đăng nhập.',
              style: GoogleFonts.inter(
                fontSize: 14.0,
                color: textColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    });
  }

  // Widget _signInButton(Size size) {
  //   if (_isProgressing) {
  //     return const Center(child: CircularProgressIndicator());
  //   }
  //   return Container(
  //       constraints: const BoxConstraints(minHeight: 48),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         color: Theme.of(context).primaryColor,
  //       ),
  //       child: Row(children: [
  //         Expanded(
  //           child: TextButton(
  //             child: Text(
  //               'Đăng nhập',
  //               style: GoogleFonts.inter(
  //                 fontSize: 16.0,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             onPressed: () async {
  //               bool isOk = await _loginMe(
  //                   emailController.value.text, passController.value.text);
  //               if (isOk) {
  //                 MyNavigation.intentWithDataReplaced(ScreenRouteName.mainPage);
  //               }
  //             },
  //           ),
  //         ),
  //       ]));
  // }

  Widget _signInButton2(Size size) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
          constraints: const BoxConstraints(minHeight: 48),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Text(
                    'Đăng nhập',
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () async {
                    bool isOk = await viewModel.login();
                    if (isOk) {
                      MyNavigation.intentWithDataReplaced(
                        ScreenRouteName.mainPage,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Future<bool> _login(String username, String password) async {
  //   AuthResponse? token = await AuthProvider.login(username, password);
  //   Result result = token!.result;
  //   if (result.tokenId.isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<bool> _loginMe(String userName, String password) async {
  //   // final String ipv4 = MyDeviceInfo.instance.networkInfo.wifiIP;
  //   // final String deviceName = MyDeviceInfo.instance.deviceName;
  //   // final String pIpv4 = MyDeviceInfo.instance.publicIpv4;
  //   // final String pIpv6 = MyDeviceInfo.instance.publicIpv6;

  //   userName = userName.toLowerCase();

  //   final loginData = LoginParam(
  //     userName: userName,
  //     password: password,
  //     // deviceName: deviceName,
  //     // deviceIpv4: ipv4,
  //     // publicIpv4: pIpv4,
  //     // publicIpv6: pIpv6
  //   );

  //   setState(() {
  //     _isProgressing = true;
  //     _loginErrorText = "";
  //   });

  //   try {
  //     var logUser = await ApiCoreService.doLogin(loginData);

  //     if (!mounted) return false;
  //     final model = context.read<MainPageModel>();
  //     if (logUser != null) {
  //       await model.saveUser(logUser);
  //       model.logOk();

  //       if (_rememberMe) {
  //         model.userSettings.cachedUserCode = emailController.value.text;
  //       } else {
  //         model.userSettings.cachedUserCode = "";
  //       }
  //       model.userSettings.cachedSecretCode = passController.value.text;
  //       model.userSettings.rememberMe = _rememberMe;
  //       await model.saveSettings();
  //       setState(() {
  //         _isProgressing = false;
  //       });
  //       // model.sendOnlineMessage();
  //       return true;
  //     } else {
  //       model.saveUser(UserToken("", "", "", "", ""));
  //       model.logError();
  //       setState(() {
  //         _loginErrorText = "Thông tin đăng nhập không đúng, vui lòng thử lại.";
  //         _isProgressing = false;
  //       });
  //       return false;
  //     }
  //   } on Exception catch (_) {
  //     setState(() {
  //       _loginErrorText = "Lỗi đăng nhập, không kết nối được với máy chủ.";
  //       _isProgressing = false;
  //     });
  //     return false;
  //   }
  // }

  // ignore: unused_element
  Widget _forgetPassButton(Size size) {
    return Container(
        alignment: Alignment.center,
        height: size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: UIHelper.BIVID_SECONDARY_COLOR,
        ),
        child: Row(children: [
          Expanded(
            child: TextButton(
              child: Text(
                'Forget password',
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () async {
                //
              },
            ),
          ),
        ]));
  }

  // ignore: unused_element
  Widget _buildContinueText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Divider(
          color: Theme.of(context).primaryColor,
        )),
        Expanded(
          child: Text(
            'Or Continue with',
            style: GoogleFonts.inter(
              fontSize: 12.0,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Expanded(
            child: Divider(
          color: UIHelper.BIVID_PRIMARY_COLOR,
        )),
      ],
    );
  }

  // ignore: unused_element
  Widget _signInGoogleFacebookButton(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //sign in google button
        Container(
          alignment: Alignment.center,
          width: size.width / 2.8,
          height: size.height / 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1.0,
              color: UIHelper.BIVID_PRIMARY_COLOR,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon of google
              SvgPicture.string(
                '<svg viewBox="63.54 641.54 22.92 22.92" ><path transform="translate(63.54, 641.54)" d="M 22.6936149597168 9.214142799377441 L 21.77065277099609 9.214142799377441 L 21.77065277099609 9.166590690612793 L 11.45823860168457 9.166590690612793 L 11.45823860168457 13.74988651275635 L 17.93386268615723 13.74988651275635 C 16.98913192749023 16.41793632507324 14.45055770874023 18.33318138122559 11.45823860168457 18.33318138122559 C 7.661551475524902 18.33318138122559 4.583295345306396 15.25492572784424 4.583295345306396 11.45823860168457 C 4.583295345306396 7.661551475524902 7.661551475524902 4.583295345306396 11.45823860168457 4.583295345306396 C 13.21077632904053 4.583295345306396 14.80519008636475 5.244435787200928 16.01918983459473 6.324374675750732 L 19.26015281677246 3.083411931991577 C 17.21371269226074 1.176188230514526 14.47633838653564 0 11.45823860168457 0 C 5.130426406860352 0 0 5.130426406860352 0 11.45823860168457 C 0 17.78605079650879 5.130426406860352 22.91647720336914 11.45823860168457 22.91647720336914 C 17.78605079650879 22.91647720336914 22.91647720336914 17.78605079650879 22.91647720336914 11.45823860168457 C 22.91647720336914 10.68996334075928 22.83741569519043 9.940022468566895 22.6936149597168 9.214142799377441 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(64.86, 641.54)" d="M 0 6.125000953674316 L 3.764603137969971 8.885863304138184 C 4.78324031829834 6.363905429840088 7.250198841094971 4.583294868469238 10.13710117340088 4.583294868469238 C 11.88963890075684 4.583294868469238 13.48405265808105 5.244434833526611 14.69805240631104 6.324373722076416 L 17.93901443481445 3.083411693572998 C 15.89257335662842 1.176188111305237 13.15520095825195 0 10.13710117340088 0 C 5.735992908477783 0 1.919254422187805 2.484718799591064 0 6.125000953674316 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(64.8, 655.32)" d="M 10.20069408416748 9.135653495788574 C 13.16035556793213 9.135653495788574 15.8496036529541 8.003005981445312 17.88286781311035 6.161093711853027 L 14.33654403686523 3.160181760787964 C 13.14749050140381 4.064460277557373 11.69453620910645 4.553541660308838 10.20069408416748 4.55235767364502 C 7.220407009124756 4.55235767364502 4.689855575561523 2.6520094871521 3.736530303955078 0 L 0 2.878881216049194 C 1.896337866783142 6.589632034301758 5.747450828552246 9.135653495788574 10.20069408416748 9.135653495788574 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(75.0, 650.71)" d="M 11.23537635803223 0.04755179211497307 L 10.31241607666016 0.04755179211497307 L 10.31241607666016 0 L 0 0 L 0 4.583295345306396 L 6.475625038146973 4.583295345306396 C 6.023715496063232 5.853105068206787 5.209692478179932 6.962699413299561 4.134132385253906 7.774986743927002 L 4.135851383209229 7.773841857910156 L 7.682177066802979 10.77475357055664 C 7.431241512298584 11.00277233123779 11.45823955535889 8.020766258239746 11.45823955535889 2.291647672653198 C 11.45823955535889 1.523372769355774 11.37917804718018 0.773431122303009 11.23537635803223 0.04755179211497307 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                width: 22.92,
                height: 22.92,
              ),
              const SizedBox(
                width: 16,
              ),
              //google txt
              Text(
                'Google',
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),

        //sign in facebook button
        Container(
          alignment: Alignment.center,
          width: size.width / 2.8,
          height: size.height / 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1.0,
              color: UIHelper.BIVID_PRIMARY_COLOR,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //facebook icon
              SvgPicture.string(
                '<svg viewBox="0.3 0.27 22.44 22.44" ><defs><linearGradient id="gradient" x1="0.500031" y1="0.970054" x2="0.500031" y2="0.0"><stop offset="0.0" stop-color="#ffffffff"  /><stop offset="1.0" stop-color="#ffffffff"  /></linearGradient></defs><path transform="translate(0.3, 0.27)" d="M 9.369577407836914 22.32988739013672 C 4.039577960968018 21.3760986328125 0 16.77546882629395 0 11.22104930877686 C 0 5.049472332000732 5.049472808837891 0 11.22105026245117 0 C 17.39262962341309 0 22.44210624694824 5.049472332000732 22.44210624694824 11.22104930877686 C 22.44210624694824 16.77546882629395 18.40252304077148 21.3760986328125 13.07252502441406 22.32988739013672 L 12.45536518096924 21.8249397277832 L 9.986735343933105 21.8249397277832 L 9.369577407836914 22.32988739013672 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(6.93, 4.65)" d="M 8.976840972900391 9.986734390258789 L 9.481786727905273 6.844839572906494 L 6.508208274841309 6.844839572906494 L 6.508208274841309 4.656734466552734 C 6.508208274841309 3.759051322937012 6.844841003417969 3.085787773132324 8.191367149353027 3.085787773132324 L 9.650103569030762 3.085787773132324 L 9.650103569030762 0.2244201600551605 C 8.864629745483398 0.1122027561068535 7.966946125030518 0 7.181471347808838 0 C 4.600629806518555 0 2.805262804031372 1.570946097373962 2.805262804031372 4.376209735870361 L 2.805262804031372 6.844839572906494 L 0 6.844839572906494 L 0 9.986734390258789 L 2.805262804031372 9.986734390258789 L 2.805262804031372 17.8975715637207 C 3.422420024871826 18.00978851318359 4.039577484130859 18.06587600708008 4.656735897064209 18.06587600708008 C 5.273893356323242 18.06587600708008 5.89105224609375 18.009765625 6.508208274841309 17.8975715637207 L 6.508208274841309 9.986734390258789 L 8.976840972900391 9.986734390258789 Z" fill="#21899c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                width: 22.44,
                height: 22.44,
              ),
              const SizedBox(
                width: 16,
              ),

              //facebook txt
              Text(
                'Facebook',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: UIHelper.BIVID_PRIMARY_COLOR,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(Size size) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          style: GoogleFonts.nunito(
            fontSize: 16.0,
            color: UIHelper.BIVID_PRIMARY_COLOR,
          ),
          children: [
            TextSpan(
              text: 'Chưa có tài khoản? Vui lòng liên hệ người quản trị.',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: 2,
      ),
    );
  }

  // ignore: unused_element
  GestureDetector _buildRegisterWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {});
        Navigator.of(context).pushNamed('register');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text.rich(
          TextSpan(
            style: GoogleFonts.nunito(
              fontSize: 16.0,
              color: UIHelper.BIVID_PRIMARY_COLOR,
            ),
            children: [
              TextSpan(
                text: 'đăng ký',
                style: GoogleFonts.nunito(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _onFingerPressed() async {
  //   final model = context.read<LoginViewModel>();
  //   final userName = model.emailController.value.text.toLowerCase();
  //   SettingApp settingApp = SharedPreferencesManager.instance.getSettingApp();
  //   if (userName.isNotEmpty &&
  //       settingApp.fingerUser.toLowerCase() != userName) {
  //     UIHelper.showError(context,
  //         'Mã người dùng $userName chưa đăng ký vân tay trên thiết bị này.');
  //     return;
  //   }
  //   var localAuth = LocalAuthentication();
  //   const iosStrings = IOSAuthMessages(
  //       cancelButton: 'cancel',
  //       goToSettingsButton: 'settings',
  //       goToSettingsDescription: 'Vui lòng cài đặt Touch ID.',
  //       lockOut: 'Vui lòng bật chức năng Touch ID');

  //   const androidStrings = AndroidAuthMessages(
  //       cancelButton: 'cancel',
  //       goToSettingsButton: 'settings',
  //       goToSettingsDescription: 'Vui lòng cài đặt Touch ID.');

  //   try {
  //     bool didAuthenticate = await localAuth.authenticate(
  //       localizedReason: 'Vui lòng quét vân tay để đăng nhập.',
  //       options: const AuthenticationOptions(
  //         useErrorDialogs: false,
  //         biometricOnly: true,
  //         stickyAuth: false,
  //       ),
  //       authMessages: [iosStrings, androidStrings],
  //     );

  //     if (didAuthenticate) {
  //       bool isOk = await _loginMe(
  //           settingApp.fingerUser, settingApp.fingerSecretCode);

  //       if (!isOk) {
  //         if (!mounted) return;
  //         UIHelper.showError(context, "Xác thực vân tay không thành công.");
  //       } else {
  //         MyNavigation.intentWithDataReplaced(ScreenRouteName.mainPage);
  //         // model.sendOnlineMessage();
  //       }
  //     }
  //   } on PlatformException catch (e) {
  //     if (e.code == auth_error.notAvailable) {
  //       UIHelper.showError(context,
  //           "Xác thực vân tay lỗi, thiết bị chưa bật chức năng nhận dạng vân tay.");
  //     }
  //     if (e.code == auth_error.notEnrolled) {
  //       UIHelper.showError(context,
  //           "Xác thực vân tay lỗi, anh chị chưa đăng ký vân tay trên thiết bị.");
  //     }
  //   }
  // }
}

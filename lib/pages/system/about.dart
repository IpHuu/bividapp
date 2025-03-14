import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:upgrader/upgrader.dart';

class AboutePage extends StatefulWidget {
  final Widget? nextPage;

  const AboutePage({Key? key, this.nextPage}) : super(key: key);
  @override
  State<AboutePage> createState() => _AboutePageState();
}

class _AboutePageState extends State<AboutePage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  late bool _isLogined = false;

  @override
  void initState() {
    super.initState();
    final model = context.read<MainPageModel>();
    // setState(() {
    //   _isLogined = SharedPreferencesManager.instance.isLogin;
    // });
    setState(() {
      _isLogined = SharedPreferencesManager.instance.isLogin;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onIntroEnd() async {
    final model = context.read<MainPageModel>();
    if (_isLogined) {
      // Navigator.pop(context);
      MyNavigation.intentWithDataReplaced(ScreenRouteName.mainPage);
    } else {
      model.showWelcomePage = false;
      MyNavigation.intentWithDataReplaced(ScreenRouteName.loginPage);
    }
    // if (_isLogined) {
    //   MyNavigation.intentWithDataReplaced(ScreenRouteName.mainPage);
    // } else {
    //   final model = context.read<MainPageModel>();
    //   model.showWelcomePage = false;
    //   MyNavigation.intentWithDataReplaced(ScreenRouteName.loginPage);
    // }
  }

  Widget _buildFullscreenImage(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyStyle = TextStyle(fontSize: 19.0, color: theme.primaryColor);
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: theme.primaryColor),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return UpgradeAlert(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [],
            ),
          ),
        ),
        globalFooter: Padding(
          padding: const EdgeInsets.only(
            bottom: 25,
          ),
          child: SizedBox(
            width: 200,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.resolveWith((states) => Colors.blue),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.blue)))),
              onPressed: () => _onIntroEnd(),
              child: Text(
                _isLogined ? 'Bỏ qua' : 'Đăng nhập',
                style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        pages: [
          PageViewModel(
            bodyWidget: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text(
                        'BIVID',
                        style: TextStyle(fontSize: 36.0, color: Colors.red),
                      ),
                      Text(
                        ' Pharma',
                        style: TextStyle(
                            fontSize: 36.0, color: theme.primaryColor),
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Horizon',
                      color: theme.primaryColor),
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    TypewriterAnimatedText('Tất cả vì sức khỏe cộng đồng'),
                    WavyAnimatedText('Nhà phân phối hàng đầu Việt Nam',
                        speed: const Duration(milliseconds: 100)),
                    TypewriterAnimatedText('Sản phẩm an toàn'),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            titleWidget: Container(
              color: Colors.transparent,
            ),
            image: _buildFullscreenImage("assets/intro/bg-01-01.png"),
            decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              pageColor: Colors.transparent,
              fullScreen: true,
              bodyFlex: 2,
              imageFlex: 1,
            ),
          ),
          PageViewModel(
            titleWidget: Container(
              color: Colors.transparent,
            ),
            bodyWidget: Container(),
            image: Padding(
              padding: const EdgeInsets.only(
                bottom: 100,
              ),
              child: _buildFullscreenImage("assets/intro/bg-01-02.png"),
            ),
            decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              pageColor: Colors.transparent,
              fullScreen: true,
              bodyFlex: 2,
              imageFlex: 1,
            ),
          ),
          PageViewModel(
            titleWidget: Container(
              color: Colors.transparent,
            ),
            bodyWidget: Container(),
            image: Padding(
              padding: const EdgeInsets.only(
                bottom: 100,
              ),
              child: _buildFullscreenImage("assets/intro/bg-01-03.png"),
            ),
            decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              pageColor: Colors.transparent,
              fullScreen: true,
              bodyFlex: 2,
              imageFlex: 1,
            ),
          ),
          PageViewModel(
            titleWidget: Container(
              color: Colors.transparent,
            ),
            bodyWidget: Container(),
            image: Padding(
              padding: const EdgeInsets.only(
                bottom: 100,
              ),
              child: _buildFullscreenImage("assets/intro/bg-01-04.png"),
            ),
            decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              pageColor: Colors.transparent,
              fullScreen: true,
              bodyFlex: 2,
              imageFlex: 1,
            ),
          ),
        ],
        onDone: () => _onIntroEnd(),
        onSkip: () => _onIntroEnd(), // You can override onSkip callback
        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        showDoneButton: false,
        showNextButton: false,
        back: const Icon(Icons.arrow_back),
        skip: const Text('Tiếp', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(20),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          color: theme.primaryColor,
          activeSize: const Size(32.0, 10.0),
          activeShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(11.0)),
          ),
        ),
      ),
    );
  }
}

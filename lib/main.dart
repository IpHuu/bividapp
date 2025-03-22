import 'dart:async';
import 'dart:io';

import 'package:bividpharma/common/dialog/dialog_viewmodel.dart';
import 'package:bividpharma/common/my_device_info.dart';
import 'package:bividpharma/common/my_http_overrides.dart';
import 'package:bividpharma/model/dtos/common/local_message.dart';
import 'package:bividpharma/model/kyduyet_online_page_model.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/model/themenotifier.dart';
import 'package:bividpharma/model/tuyendung_page_model.dart';
import 'package:bividpharma/pages/Auth/view_model/login_viewmodel.dart';
import 'package:bividpharma/pages/banhang/orders/create_order/provider/create_order_provider.dart';
import 'package:bividpharma/services/firebase/firebase_service.dart';
import 'package:bividpharma/services/local_message_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
// import 'package:upgrader/upgrader.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:signalr_core/signalr_core.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await setupFlutterNotifications();
  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.exception.toString());
    if (kReleaseMode) exit(1);
  };

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HttpOverrides.global = MyHttpOverrides();

  // Only call clearSavedSettings() during testing to reset internal values.
  // await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  // Firebase settings
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // if (!kIsWeb) {
  //   await setupFlutterNotifications();
  // }
  //FirebaseMessaging messaging = FirebaseMessaging.instance;

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // print('User granted permission: ${settings.authorizationStatus}');

  // await FirebaseMessaging.instance.subscribeToTopic("notify");
  // End of firebase settings

  late BividApp bividApp;
  // final BividBackgroundService bividService = BividBackgroundService();
  final MainPageModel mainModel = MainPageModel();

  await LocalMessageService.initService();
  await mainModel.initData();

  // await bividService.initService(onBackgroundStart);

  await MyDeviceInfo.instance.initPlatformState();
  await MyDeviceInfo.instance.initReadNetworkInfo();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    // if (kReleaseMode) exit(1);
    // ApiCoreService.sendErrorLog({
    //   "taskType": "CLIENT",
    //   "docType": "ERROR",
    //   "userCode": "",
    //   "logData":
    //       "Stack: ${details.stack}, Exception: ${details.exceptionAsString()}",
    //   "appVersion": "string",
    //   "ipAdress":
    //       "IPv4:${MyDeviceInfo.instance.publicIpv4} ,IPv6:${MyDeviceInfo.instance.publicIpv6} ,Wifi:${MyDeviceInfo.instance.networkInfo.wifiIP}",
    //   "deviceName": MyDeviceInfo.instance.deviceName
    // });
  };
  await SharedPreferencesManager.instance.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DialogViewModel()),
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider<MainPageModel>(create: (_) => mainModel),
      ChangeNotifierProvider<KyDuyetOnlinePageModel>(
          create: (_) => KyDuyetOnlinePageModel()),
      ChangeNotifierProvider<TuyenDungPageModel>(
          create: (_) => TuyenDungPageModel()),
      ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(UIHelper.defaultTheme)),
      ChangeNotifierProvider(create: (context) => CreateOrderProvider()),
    ],
    builder: (con, child) {
      bividApp = const BividApp();
      return bividApp;
    },
  ));
}

Future<void> onBackgroundStart(ServiceInstance service) async {
  // final localNofity = LocalNotify();
  // localNofity.initLocalNotify();

  Timer.periodic(const Duration(seconds: 100), (timer) async {
    //
  });
}

class BividApp extends StatefulWidget {
  const BividApp({Key? key}) : super(key: key);

  // final DefaultReconnectPolicy rtr = DefaultReconnectPolicy();

  @override
  State<BividApp> createState() => _BividAppState();
}

class _BividAppState extends State<BividApp> {
  // final LocalNotify _localNotify = LocalNotify();
  // GlobalKey<ScaffoldState> _scaffoldBividAppKey = new GlobalKey();

  final bool isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  late MainPageModel _model;
  @override
  void initState() {
    super.initState();

    // Firebase init----------------------------------------------------
    // FirebaseMessaging.onMessage.listen(_showFlutterNotification);
    //
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   // print('A new onMessageOpenedApp event was published!');
    //   Navigator.pushNamed(
    //     context,
    //     ScreenRouteName.mainPage,
    //     arguments: MessageArguments(message, true),
    //   );
    // });

    //------------------------------------------------------------------
    // _localNotify.initLocalNotify();

    _model = context.read<MainPageModel>();
    _model.readSettings();

/* 
    _model.localMessageStreamController.stream.listen((event) {
    _localNotify.showNotification(
          title: event.title,
          bodyText: event.body ?? 'Không có nội dung thông báo.');
    });
*/

    FlutterNativeSplash.remove();
    configLoading();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = Theme.of(context);
    EasyLoading.instance
      ..textColor = theme.primaryColor
      ..indicatorColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.transparent
      ..indicatorColor = theme.primaryColor
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, provider, _) {
        return MaterialApp(
          key: UIHelper.bividMainApp,
          title: 'BIVID Pharam',
          localizationsDelegates: const [
            // AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            FormBuilderLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('vi', ''), // Vietnam, no country code
          ],
          debugShowCheckedModeBanner: false,
          theme: provider.myTheme,
          initialRoute: ScreenRouteName.aboutPage,
          navigatorKey: mynavigatorKey,
          routes: ScreenRouteName.mainRouter,
          builder: EasyLoading.init(),
        );
      },
    );
  }

  void _showFlutterNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    StyleInformation? styleInfo;

    final data = message.data;
    String imageUrl, summaryText;

    imageUrl = message.data["imageUrl"] ?? '';
    summaryText = message.data["summaryText"] ?? '';

    if (data.isNotEmpty) {
      try {
        LocalMessage msg = LocalMessage.fromMap(data);
        _model.addLocalCloudMessage(msg);
      } catch (ex) {
        //
      }
    }

    if (notification != null && android != null && !kIsWeb) {
      if (imageUrl.isNotEmpty) {
        styleInfo = await _getBigPictureNotificationURL(
            imageUrl, notification.title ?? "", summaryText);
      }
      styleInfo ??= BigTextStyleInformation(
        notification.body ?? "",
        htmlFormatBigText: true,
        contentTitle: notification.title ?? "",
        htmlFormatContentTitle: true,
        summaryText: summaryText,
        htmlFormatSummaryText: true,
      );

      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            styleInformation: styleInfo,
            icon: 'app_icon',
            ongoing: true,
            importance: Importance.defaultImportance,
            priority: Priority.defaultPriority,
            largeIcon: const DrawableResourceAndroidBitmap('app_icon'),
            autoCancel: true,
            channelShowBadge: true,
            enableLights: true,
            fullScreenIntent: true,
            playSound: true,
            visibility: NotificationVisibility.public,
          ),
        ),
      );
    }
  }

  Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  Future<BigPictureStyleInformation?> _getBigPictureNotificationURL(
      String url400_800, String htmlTitle, String htmlSumaryText) async {
    try {
      // final ByteArrayAndroidBitmap largeIcon =
      //     ByteArrayAndroidBitmap(await _getByteArrayFromUrl(url48_48));
      final ByteArrayAndroidBitmap bigPicture =
          ByteArrayAndroidBitmap(await _getByteArrayFromUrl(url400_800));

      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(bigPicture,
              // hideExpandedLargeIcon: true,
              largeIcon: const DrawableResourceAndroidBitmap('app_icon'),
              contentTitle: htmlTitle,
              htmlFormatContentTitle: true,
              summaryText: htmlSumaryText,
              htmlFormatSummaryText: true);
      return bigPictureStyleInformation;
    } catch (ex) {
      return null;
    }
  }

  void configLoading() {
    final theme = Theme.of(context);
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 60
      ..textColor = theme.primaryColor
      ..indicatorColor = Colors.transparent
      ..radius = 20
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.transparent
      ..indicatorColor = theme.primaryColor
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[]
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid;
  }
}

import 'dart:async';

import 'package:bividpharma/common/bivid_connection.dart.txt';
import 'package:bividpharma/common/bivid_settings.dart';
// import 'package:bividpharma/common/local_notify.txt';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class BividBackgroundService {
  //Properties
  BividConnection? _bividConnection;
  BividSettings? _bividSettings;

  final _backgroundService = FlutterBackgroundService();
  // final _localNofity = LocalNotify();

  /* final MethodChannel _methodChannel =
      const MethodChannel('dexterx.dev/flutter_local_notifications_example'); */

  BividSettings get localSetting => _bividSettings!;
  BividConnection get hubConnection => _bividConnection!;
  FlutterBackgroundService get backgroundService => _backgroundService;

  BividBackgroundService() {
    _bividSettings = BividSettings();
    _bividConnection = BividConnection();
    hubConnection
        .initConnection(
            onlineMessageFunc: _onlineTrigger,
            signedMessageFunc: _onSignedTrigger)
        .then((value) {
      hubConnection.start();
    });

    // _localNofity.initLocalNotify();
  }

  Future<void> initService(void Function(ServiceInstance) startFunc) async {
    await _initBackgroundService(startFunc);
    //backgroundService.startService();
  }

  Future<void> showNotify(String bodyText) async {
    debugPrint('_localNofity.showNotify');
    // await _localNofity.showNotification(bodyText: bodyText);
  }

  Future<void> _initBackgroundService(
      void Function(ServiceInstance) startFunc) async {
    try {
      await backgroundService.configure(
        androidConfiguration: AndroidConfiguration(
          onStart: startFunc,
          autoStart: false,
          isForegroundMode: true,
        ),
        iosConfiguration: IosConfiguration(
          autoStart: false,
          onForeground: startFunc,
          onBackground: _onIosBackground,
        ),
      );
    } on Exception catch (ex) {
      debugPrint('$ex');
    }
    //_backgroundService.startService();
  }

  //Hub connnection

  //Store data

  //Notify

  //State

  void _onlineTrigger(List? args) {}

  Future<void> _onSignedTrigger(List? args) async {
    if (args == null) return;
    //await _localNofity.showNotification(args[0].toString());
  }

  FutureOr<bool> _onIosBackground(ServiceInstance service) {
    return Future.value(true);
  }
}

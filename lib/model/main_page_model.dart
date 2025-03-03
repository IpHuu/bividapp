import 'dart:async';
// import 'package:bividpharma/common/bivid_connection.dart';
import 'package:bividpharma/common/bivid_settings.dart';
// import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/local_message.dart';
import 'package:bividpharma/model/dtos/common/received_notification.dart';
// import 'package:bividpharma/model/dtos/common/signed_message_args.dart';
import 'package:bividpharma/model/dtos/connection_state.dart';
import 'package:bividpharma/model/dtos/user_settings.dart';
import 'package:bividpharma/model/dtos/usertoken.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/services/local_message_service.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:signalr_core/signalr_core.dart';

class SignedStreamArgs {
  final String docType;
  final int documentId;

  SignedStreamArgs(this.docType, this.documentId);
}

class MainPageModel with ChangeNotifier, DiagnosticableTreeMixin {
  BividSettings? _bividSettings;

  late MyConnectionState _connectionState;
  late final String _errorText = "";
  late UserToken _loginedUser;
  late UserSettings _userSettings;
  late bool _logined = false;
  late bool showWelcomePage = true;
  late int _messageNumber = 0;

  final StreamController<int> _giayPhepStreamController =
      StreamController<int>.broadcast();
  final StreamController<int> _giayTamUngStreamController =
      StreamController<int>.broadcast();
  final StreamController<int> _phieuTQTStreamController =
      StreamController<int>.broadcast();
  final StreamController<int> _phieuKHCVStreamController =
      StreamController<int>.broadcast();
  final StreamController<int> _phieuDXMHStreamController =
      StreamController<int>.broadcast();
  final StreamController<int> _phieuRaCongStreamController =
      StreamController<int>.broadcast();
  final StreamController<int> _phieuDNCapSimStreamController =
      StreamController<int>.broadcast();
  final StreamController<int> _phieuDNMuaVppStreamController =
      StreamController<int>.broadcast();
  final StreamController<int> _lenhCongTacStreamController =
      StreamController<int>.broadcast();

  final StreamController<int> _documentChartStreamController =
      StreamController<int>.broadcast();
  final StreamController<ReceivedNotification> _notifyStreamController =
      StreamController<ReceivedNotification>.broadcast();
  final StreamController<LocalMessage> _localMessageStreamController =
      StreamController<LocalMessage>.broadcast();
  final StreamController<String?> _selectNotificationSubject =
      StreamController<String?>.broadcast();

  final StreamController<MyConnectionState> _connectionController =
      StreamController<MyConnectionState>.broadcast();

  static const String currentVersion = 'Phiên bản 1.3.16';

  MyConnectionState get myConnectionState => _connectionState;
  String get errorText => _errorText;
  UserToken get loginedUser => _loginedUser;
  UserSettings get userSettings => _userSettings;
  BividSettings get localSetting => _bividSettings!;

  StreamController<MyConnectionState> get connectionStream =>
      _connectionController;
  StreamController<int> get giayPhepStream => _giayPhepStreamController;
  StreamController<int> get giayTamUngStream => _giayTamUngStreamController;
  StreamController<int> get giayTQTStream => _phieuTQTStreamController;
  StreamController<int> get giayKHCVStream => _phieuKHCVStreamController;
  StreamController<int> get giayDXMHStream => _phieuDXMHStreamController;
  StreamController<int> get giayRaCongStream => _phieuRaCongStreamController;
  StreamController<int> get giayDNCapSimStream =>
      _phieuDNCapSimStreamController;
  StreamController<int> get giayDNMuaVppStream =>
      _phieuDNMuaVppStreamController;
  StreamController<int> get giayLenhCongTacStream =>
      _lenhCongTacStreamController;

  final StreamController<int> _keHoachCongTacStreamController =
      StreamController<int>.broadcast();
  StreamController<int> get giayKeHoachCongTacStream =>
      _keHoachCongTacStreamController;

  final StreamController<int> _deNghiCapVppStreamController =
      StreamController<int>.broadcast();
  StreamController<int> get giayDeNghiCapVppStream =>
      _deNghiCapVppStreamController;

  final StreamController<int> _chiPhiCongTacStreamController =
      StreamController<int>.broadcast();
  StreamController<int> get giayChiPhiCongTacStream =>
      _chiPhiCongTacStreamController;

  final StreamController<SignedStreamArgs> _documentStreamController =
      StreamController<SignedStreamArgs>.broadcast();
  StreamController<SignedStreamArgs> get documentSignedStream =>
      _documentStreamController;

  StreamController<int> get documentChartStream =>
      _documentChartStreamController;
  StreamController<LocalMessage> get localMessageStreamController =>
      _localMessageStreamController;
  StreamController<ReceivedNotification>
      get didReceivedNotifyStreamController => _notifyStreamController;
  StreamController<String?> get selectNotificationSubject =>
      _selectNotificationSubject;

  static const _pageSize = 20;

  int get pageSize => _pageSize;
  bool get logined => _logined;
  int get messageNumber => _messageNumber;

  MainPageModel() {
    _connectionState = MyConnectionState();
    _loginedUser = UserToken("", "", "", "", "");
    _bividSettings = BividSettings();
    _userSettings = _bividSettings!.userSettings;
  }

  Future<void> initData() {
    _messageNumber = LocalMessageService.countMessages();
    return Future.value();
  }

  void addLocalMessage(LocalMessage msg) {
    try {
      //
      //Save to device
      LocalMessageService.addMessageItem(msg);
      refreshMessageNumber();
      localMessageStreamController.add(msg);
    } on Exception catch (_) {
      //
    }
  }

  void addLocalCloudMessage(LocalMessage msg) {
    try {
      //Save to device
      if (msg.body == null || msg.title == null) return;
      if (msg.body!.isEmpty || msg.title!.isEmpty) return;

      LocalMessageService.addCloudMessageItem(msg);
      refreshMessageNumber();
      localMessageStreamController.add(msg);
    } on Exception catch (_) {
      //
    }
  }

  void logOk() {
    _logined = true;
    //SharedPreferencesManager.instance.saveIsLogin = true;
    notifyListeners();

    //FirebaseMessaging.instance.subscribeToTopic(_loginedUser.userName);
    // _bividConnection!.start();
  }

  void logError() {
    _logined = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    saveUser(UserToken.empty());
    _logined = false;
    notifyListeners();
    // _bividConnection!.stop();
  }

  Future<void> saveUser(UserToken user) async {
    await localSetting.saveUser(user);
    _loginedUser.copyFrom(user);
    ApiCoreService.loginTokenId = _loginedUser.tokenId;
  }

  void readUser() async {
    var user = await localSetting.readUser();
    if (user == null) return;
    _loginedUser.copyFrom(user);
    ApiCoreService.loginTokenId = _loginedUser.tokenId;
  }

  Future<void> saveSettings() async {
    localSetting.userSettings.copyFrom(_userSettings);
    await localSetting.saveSettings();
    notifyListeners();
  }

  Future<void> readSettings() async {
    var data = await localSetting.readSettings();
    _userSettings.copyFrom(data);
    notifyListeners();
  }

  // void _onConnected(String? ex) {
  //   _connectionState.state = HubState.connected;
  //   connectionStream.add(_connectionState);
  // }

  // void _onConnecting(Exception? ex) {
  //   _connectionState.state = HubState.connecting;
  //   connectionStream.add(_connectionState);
  // }

  // void _onConnectionClosed(Exception? ex) {
  //   _connectionState.state = HubState.disconnected;
  //   connectionStream.add(_connectionState);
  // }

  void refreshMessageNumber() {
    _messageNumber = LocalMessageService.countMessages();
  }
}

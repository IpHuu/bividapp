// ignore_for_file: avoid_print

import 'dart:convert';
// import 'package:bividpharma/firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Working example of FirebaseMessaging.
/// Please use this in order to verify messages are working in foreground, background & terminated state.
/// Setup your app following this guide:
/// https://firebase.google.com/docs/cloud-messaging/flutter/client#platform-specific_setup_and_requirements):
///
/// Once you've completed platform specific requirements, follow these instructions:
/// 1. Install melos tool by running `flutter pub global activate melos`.
/// 2. Run `melos bootstrap` in FlutterFire project.
/// 3. In your terminal, root to ./packages/firebase_messaging/firebase_messaging/example directory.
/// 4. Run `flutterfire configure` in the example/ directory to setup your app with your Firebase project.
/// 5. Run the app on an actual device for iOS, android is fine to run on an emulator.
/// 6. Use the following script to send a message to your device: scripts/send-message.js. To run this script,
///    you will need nodejs installed on your computer. Then the following:
///     a. Download a service account key (JSON file) from your Firebase console, rename it to "google-services.json" and add to the example/scripts directory.
///     b. Ensure your device/emulator is running, and run the FirebaseMessaging example app using `flutter run --no-pub`.
///     c. Copy the token that is printed in the console and paste it here: https://github.com/firebase/flutterfire/blob/01b4d357e1/packages/firebase_messaging/firebase_messaging/example/lib/main.dart#L32
///     c. From your terminal, root to example/scripts directory & run `npm install`.
///     d. Run `npm run send-message` in the example/scripts directory and your app will receive messages in any state; foreground, background, terminated.
///  Note: Flutter API documentation for receiving messages: https://firebase.google.com/docs/cloud-messaging/flutter/receive
///  Note: If you find your messages have stopped arriving, it is extremely likely they are being throttled by the platform. iOS in particular
///  are aggressive with their throttling policy.
///
/// To verify that your messages are being received, you ought to see a notification appearon your device/emulator via the flutter_local_notifications plugin.
/// Define a top-level named handler which background/terminated messages will
/// call. Be sure to annotate the handler with `@pragma('vm:entry-point')` above the function declaration.

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;
bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'bivid_pharma_main_channel', // id
    'Bivid Notify Agent', // title
    description:
        'Kênh này được sử dụng để nhận thông báo từ BIVID PORTAL.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

Future<Uint8List> _getByteArrayFromUrl(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

Future<BigPictureStyleInformation> _showBigPictureNotificationURL(
    String imageUrl) async {
  final ByteArrayAndroidBitmap largeIcon =
      ByteArrayAndroidBitmap(await _getByteArrayFromUrl(imageUrl));
  final ByteArrayAndroidBitmap bigPicture =
      ByteArrayAndroidBitmap(await _getByteArrayFromUrl(imageUrl));

  final BigPictureStyleInformation bigPictureStyleInformation =
      BigPictureStyleInformation(bigPicture,
          largeIcon: largeIcon,
          hideExpandedLargeIcon: false,
          // contentTitle: 'overridden <b>big</b> content title',
          htmlFormatContentTitle: true,
          // summaryText: 'summary <i>text</i>',
          htmlFormatSummaryText: true);
  return bigPictureStyleInformation;
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

// Crude counter to make messages unique
int _messageCount = 0;

/// The API endpoint here accepts a raw FCM payload for demonstration purposes.
String constructFCMPayload(String? token) {
  _messageCount++;
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      'count': _messageCount.toString(),
    },
    'notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This notification (#$_messageCount) was created via FCM!',
    },
  });
}

Future<void> sendPushMessage(String? token) async {
  if (token == null) {
    print('Unable to send FCM message, no token exists.');
    return;
  }
  try {
    // ignore: unused_local_variable
    var res = await http.post(
      Uri.parse('https://api.rnfirebase.io/messaging/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'application/json; charset=UTF-8'
        // 'application/x-www-form-urlencoded'
      },
      body: constructFCMPayload(token),
    );
    print('FCM request for device sent!');
  } catch (e) {
    print(e);
  }
}

// ignore_for_file: avoid_print

import 'package:bividpharma/services/firebase/firebase_service.dart';
import 'package:bividpharma/services/firebase/message_view.dart';
import 'package:bividpharma/services/firebase/message_list.dart';
import 'package:bividpharma/services/firebase/permissions.dart';
import 'package:bividpharma/services/firebase/token_monitor.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class FirebaseMessagePage extends StatefulWidget {
  const FirebaseMessagePage({Key? key}) : super(key: key);

  @override
  State<FirebaseMessagePage> createState() => _FirebaseMessagePageState();
}

class _FirebaseMessagePageState extends State<FirebaseMessagePage> {
  String? _token;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Messaging'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: onActionSelected,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'subscribe',
                  child: Text('Subscribe to topic'),
                ),
                const PopupMenuItem(
                  value: 'unsubscribe',
                  child: Text('Unsubscribe to topic'),
                ),
                const PopupMenuItem(
                  value: 'get_apns_token',
                  child: Text('Get APNs token (Apple only)'),
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () => sendPushMessage(_token),
          backgroundColor: Colors.white,
          child: const Icon(Icons.send, color: Colors.red),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MetaCard('Permissions', Permissions()),
            MetaCard(
              'FCM Token',
              TokenMonitor((token) {
                _token = token;
                return token == null
                    ? const CircularProgressIndicator()
                    : Text(token, style: const TextStyle(fontSize: 12));
              }),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseMessaging.instance
                    .getInitialMessage()
                    .then((RemoteMessage? message) {
                  if (message != null) {
                    Navigator.pushNamed(
                      context,
                      ScreenRouteName.messageViewPage,
                      arguments: MessageArguments(message, true),
                    );
                  }
                });
              },
              child: const Text('getInitialMessage()'),
            ),
            const MetaCard('Message Stream', MessageList()),
          ],
        ),
      ),
    );
  }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
          );
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
          );
        }
        break;
      case 'unsubscribe':
        {
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
          );
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
          );
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
              'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
            );
          }
        }
        break;
      default:
        break;
    }
  }
}

/// UI Widget for displaying metadata.
class MetaCard extends StatelessWidget {
  final String _title;
  final Widget _children;

  // ignore: public_member_api_docs
  const MetaCard(this._title, this._children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(_title, style: const TextStyle(fontSize: 18)),
              ),
              _children,
            ],
          ),
        ),
      ),
    );
  }
}

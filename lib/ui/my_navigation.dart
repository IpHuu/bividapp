// import 'package:bividpharma/services/firebase/message.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> mynavigatorKey = GlobalKey<NavigatorState>();

class MyNavigation {
  static intentWithData(String routeName, {Object? arguments}) {
    mynavigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static intentWithDataReplaced(String routeName, {Object? arguments}) {
    mynavigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static back() => mynavigatorKey.currentState?.pop();
}

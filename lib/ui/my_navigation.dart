// import 'package:bividpharma/services/firebase/message.dart';
import 'package:bividpharma/ui/screen_routes.dart';
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

  static resetToLogin() {
    mynavigatorKey.currentState?.pushNamedAndRemoveUntil(
      ScreenRouteName.loginPage, // Màn hình Login
      (route) => false, // Xóa toàn bộ stack
    );
  }

  static back() => mynavigatorKey.currentState?.pop();
}

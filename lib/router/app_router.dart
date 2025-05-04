import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/account_page.dart';

class AppRouter {
  static const String home = '/';
  static const String account = '/account';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case account:
        return MaterialPageRoute(builder: (_) => AccountPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
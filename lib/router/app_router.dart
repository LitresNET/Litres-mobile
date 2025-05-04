import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class AppRouter {
  static const String home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
import 'package:flutter/material.dart';
import 'package:litres_mobile/pages/search_page.dart';

import '../pages/account_page.dart';
import '../pages/book_page.dart';
import '../pages/home_page.dart';

class AppRouter {
  static const String home = '/';
  static const String account = '/account';
  static const String book = '/book';
  static const String search = '/search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case account:
        return MaterialPageRoute(builder: (_) => AccountPage());
      case book:
        return MaterialPageRoute(builder: (_) => BookPage(bookData: settings.arguments as Map<String, dynamic>));
      case search:
        return MaterialPageRoute(builder: (_) => SearchPage(searchData: settings.arguments as Map<String, dynamic>));
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
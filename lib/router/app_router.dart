import 'package:flutter/material.dart';
import 'package:litres_mobile/pages/payment_page.dart';
import 'package:litres_mobile/pages/search_page.dart';
import 'package:litres_mobile/pages/sign_up_page.dart';

import '../pages/account_page.dart';
import '../pages/book_page.dart';
import '../pages/home_page.dart';
import '../pages/sign_in_page.dart';

class AppRouter {
  static const String account = '/account';
  static const String book = '/book';
  static const String home = '/';
  static const String payment = '/payment';
  static const String search = '/search';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case account:
        return MaterialPageRoute(builder: (_) => AccountPage());
      case book:
        return MaterialPageRoute(builder: (_) => BookPage(bookData: settings.arguments as Map<String, dynamic>));
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case payment:
        return MaterialPageRoute(builder: (_) => PaymentPage());
      case search:
        return MaterialPageRoute(builder: (_) => SearchPage(searchData: settings.arguments as Map<String, dynamic>));
      case signIn:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
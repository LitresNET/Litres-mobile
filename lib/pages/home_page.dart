import 'package:flutter/material.dart';
import '../router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore',
      debugShowCheckedModeBanner: false,
      home: BookstoreHome(),
    );
  }
}

class BookstoreHome extends StatelessWidget {
  const BookstoreHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}

import 'package:flutter/material.dart';
import '../router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, AppRouter.account),
          child: Text('Go to Account'),
        ),
      ),
    );
  }
}
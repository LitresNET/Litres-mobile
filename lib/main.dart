import 'package:flutter/material.dart';
import 'styles/app_styles.dart';
import 'router/app_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture Navigation',
      theme: AppStyles.theme,
      initialRoute: AppRouter.signIn,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
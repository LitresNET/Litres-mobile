import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/account/account_bloc.dart';
import 'blocs/auth/auth_bloc.dart';
import 'styles/app_styles.dart';
import 'router/app_router.dart';

void main() => runApp(
  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AccountBloc()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: const MyApp()
  )
);

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
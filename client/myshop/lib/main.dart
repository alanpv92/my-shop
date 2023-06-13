import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/controllers/authentication.dart';

import 'package:myshop/theme/app.dart';
import 'package:myshop/ui/screen/authentication.dart';
import 'package:myshop/ui/screen/dash.dart';

void main(List<String> args) async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  final Widget authenticationScreenWidget = const AuthenticationScreen();
  final Widget dashScreenWidget = const Dash();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider.select((value) => value.isAuthenticated));
    return MaterialApp(
      theme: ref.read(appThemeProvider).getLightTheme(),
      home: ref.read(authControllerProvider).isAuthenticated
          ? dashScreenWidget
          : authenticationScreenWidget,
    );
  }
}

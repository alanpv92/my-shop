import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/controllers/authentication.dart';

import '../../screen/authentication.dart';
import '../../screen/dash.dart';

class AuthManager extends ConsumerWidget {
  const AuthManager({super.key});
  final Widget authenticationScreenWidget = const AuthenticationScreen();
  final Widget dashScreenWidget = const Dash();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider.select((value) => value.isAuthenticated));
    return ref.read(authControllerProvider).isAuthenticated
        ? dashScreenWidget
        : authenticationScreenWidget;
  }
}

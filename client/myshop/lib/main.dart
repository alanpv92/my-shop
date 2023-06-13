import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myshop/data/models/authentication%20data/login.dart';
import 'package:myshop/services/authentication/app.dart';
import 'package:myshop/theme/app.dart';
import 'package:myshop/ui/screen/authentication.dart';

void main(List<String> args) async {


  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return MaterialApp(
      theme: ref.read(appThemeProvider).getLightTheme(),
      home: const AuthenticationScreen(),
    );
  }
}

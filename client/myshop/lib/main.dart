import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:myshop/managers/route.dart';
import 'package:myshop/theme/app.dart';


import 'package:myshop/ui/screen/app_loader.dart';


void main(List<String> args) async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
    getPages: RouterManger.getAllPages(),
    theme: ref.read(appThemeProvider).getLightTheme(),
    home:const AppLoaderScreen(),
    );
    // ref.watch(authControllerProvider.select((value) => value.isAuthenticated));
    // return MaterialApp(
    //   theme: ref.read(appThemeProvider).getLightTheme(),
    //   home: ref.read(authControllerProvider).isAuthenticated
    //       ? dashScreenWidget
    //       : authenticationScreenWidget,
    // );
  }
}

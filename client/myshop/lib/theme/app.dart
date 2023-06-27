import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/managers/color.dart';

final appThemeProvider = Provider((ref) {
  final colorManger = ref.read(colorManagerProvider);
  return AppTheme(colorManager: colorManger);
});

class AppTheme {
  final ColorManager colorManager;
  AppTheme({required this.colorManager});
  ThemeData getLightTheme() => ThemeData.light().copyWith(
      primaryColor: colorManager.primaryColor,
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w800,
              color: colorManager.primaryColor),
          headlineMedium: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: colorManager.primaryColor),
          headlineSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: colorManager.primaryColor),
          labelLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: colorManager.primaryColor),
          labelMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          )));
}

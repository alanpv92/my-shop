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
      textTheme: const TextTheme(
          labelMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)));
}

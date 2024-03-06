import 'package:customer/common_export.dart';

class TTheme {
  TTheme._();

  static ThemeData light = ThemeData(
      brightness: Brightness.light, scaffoldBackgroundColor: Colors.white);
  static ThemeData dark = ThemeData(
      brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black);
}

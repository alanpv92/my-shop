import 'package:customer/common_export.dart';


class TTheme {
  TTheme._();

  static ThemeData light = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: TColors.white,
      primaryColor: TColors.primary,
      elevatedButtonTheme: TElevatedButtonTheme.light,
      textTheme: TTextTheme.light);
  static ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: TColors.black,

      primaryColor: TColors.primary,
      elevatedButtonTheme: TElevatedButtonTheme.dark,
      textTheme: TTextTheme.dark);
}

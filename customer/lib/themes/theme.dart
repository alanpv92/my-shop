import 'package:customer/common_export.dart';
import 'package:customer/themes/custom/card.dart';
import 'package:customer/themes/custom/text_form_field.dart';

class TTheme {
  TTheme._();

  static ThemeData light = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: TColors.white,
      primaryColor: TColors.primary,
      elevatedButtonTheme: TElevatedButtonTheme.light,
      cardTheme: TCardTheme.light,
      inputDecorationTheme: TTextFormField.light,
      textTheme: TTextTheme.light);
  static ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: TColors.black,
      primaryColor: TColors.primary,
      elevatedButtonTheme: TElevatedButtonTheme.dark,
      cardTheme: TCardTheme.dark,
         inputDecorationTheme: TTextFormField.dark,
      textTheme: TTextTheme.dark);
}

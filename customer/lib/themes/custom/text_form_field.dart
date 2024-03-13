import 'package:customer/common_export.dart';

class TTextFormField {
  TTextFormField._();

  static OutlineInputBorder defaultLightBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(TBorderRadius.xs)),
      borderSide: BorderSide(color: TColors.white));

  static OutlineInputBorder defaultDarkBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(TBorderRadius.xs)),
      borderSide: BorderSide(color: TColors.black));

  static InputDecorationTheme light = InputDecorationTheme(
    fillColor: TColors.black,
    filled: true,
    prefixIconColor: TColors.primary,
     hintStyle: TextStyle(
      fontSize: 22,
      color: TColors.primary
    ),
    enabledBorder: TTextFormField.defaultLightBorder,
    focusedBorder: TTextFormField.defaultLightBorder,
    border: TTextFormField.defaultLightBorder,
  );
  static InputDecorationTheme dark = InputDecorationTheme(
    fillColor: TColors.white,
    filled: true,
  
     prefixIconColor: TColors.primary,
    hintStyle: TextStyle(
      fontSize: 22,
      color: TColors.primary
    ),
    enabledBorder: TTextFormField.defaultDarkBorder,
    focusedBorder: TTextFormField.defaultDarkBorder,
    border: TTextFormField.defaultDarkBorder,
  );
}

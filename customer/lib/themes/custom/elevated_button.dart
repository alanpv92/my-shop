import 'package:customer/common_export.dart';
class TElevatedButtonTheme {
    TElevatedButtonTheme._();
    static ElevatedButtonThemeData light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: TColors.white,
        backgroundColor: TColors.primary,
        disabledBackgroundColor: TColors.secondary,
        disabledForegroundColor: TColors.secondary,
        side:  BorderSide(color: TColors.primary),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle:  TextStyle(
          fontSize: 22,
          color: TColors.white,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
  );
  static ElevatedButtonThemeData dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: TColors.black,
        backgroundColor: TColors.primary,
        disabledBackgroundColor: TColors.secondary,
        disabledForegroundColor: TColors.secondary,
        side:  BorderSide(color: TColors.primary),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle:  TextStyle(
          fontSize: 22,
          color: TColors.white,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
  );
}

import 'package:customer/common_export.dart';

class AuthenticationBackground extends StatelessWidget {
  const AuthenticationBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TSize.h * 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: TColors.secondary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(TBorderRadius.lg),
              bottomRight: Radius.circular(TBorderRadius.lg))),
    );
  }
}

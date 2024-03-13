import 'package:customer/common_export.dart';

class AuthenticationStatusChangeButton extends StatelessWidget {
  const AuthenticationStatusChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthenticationController>();
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: TBorderRadius.lg, vertical: TBorderRadius.md),
        child: BouncingElevatedButton(
            text: authController.isSignUpMode
                ? TStrings.authLoginToggleBtn
                : TStrings.authSignUpToggleBtn,
            onPressed: () {
              context.read<AuthenticationController>().toggleAuthMode();
            }));
  }
}

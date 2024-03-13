import 'package:customer/common_export.dart';

class AuthenticationBox extends StatelessWidget {
  const AuthenticationBox({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthenticationController>();
    return Card(
      margin: EdgeInsets.symmetric(horizontal: TPadding.lg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(TBorderRadius.lg)),
      ),
      child: Padding(
        padding: EdgeInsets.all(TPadding.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (context.read<AuthenticationController>().isSignUpMode)
              TextFormField(
                style: TextStyle(color: TColors.primary, fontSize: 22),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.people),
                    hintText: TStrings.authUserNameHint),
              ),
            VGap(TGaps.md),
            TextFormField(
              style: TextStyle(color: TColors.primary, fontSize: 22),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: TStrings.authUserEmailHint),
            ),
            VGap(TGaps.md),
            TextFormField(
              style: TextStyle(color: TColors.primary, fontSize: 22),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: TStrings.authPasswordHint),
            ),
            VGap(TGaps.xl),
            ExpandingButton(
              text: authController.isSignUpMode
                  ? TStrings.authSignUpBtn
                  : TStrings.authLoginBtn,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

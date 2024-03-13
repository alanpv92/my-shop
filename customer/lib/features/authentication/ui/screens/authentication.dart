import 'package:customer/common_export.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          AuthenticationBackground(),
          Center(child: AuthenticationBox()),
          Align(
            alignment: Alignment.bottomCenter,
            child: AuthenticationStatusChangeButton(),
          )
        ],
      )),
    );
  }
}



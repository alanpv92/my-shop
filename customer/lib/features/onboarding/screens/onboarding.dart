import 'dart:developer';

import 'package:customer/common_export.dart';

class OboardingScreen extends StatelessWidget {
  const OboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    log("i am being called");
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}

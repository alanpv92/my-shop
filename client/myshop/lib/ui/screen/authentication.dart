import 'package:flutter/material.dart';
import 'package:myshop/ui/widgets/authentication/auth_box.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    "My Shop",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 50,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: AuthBox()),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

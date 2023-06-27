import 'package:flutter/material.dart';
import 'package:myshop/managers/text.dart';
import 'package:myshop/ui/widgets/authentication/auth_box.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    TextManger.instance.appName,
                    style:Theme.of(context).textTheme.headlineLarge,
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                 const Expanded(child: AuthBox()),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

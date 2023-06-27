

import 'package:flutter/material.dart';

import 'package:myshop/managers/text.dart';
import 'package:myshop/ui/widgets/authentication/otp_verification_box_container.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                TextManger.instance.verifyOtp,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "${TextManger.instance.otpSendEmail} alan@gmail.com",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              TextManger.instance.otpExpireMessage,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            OtpVerificationBoxContainer(),
          ],
        ),
      ),
    );
  }
}




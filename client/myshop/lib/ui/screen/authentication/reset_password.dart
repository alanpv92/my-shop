import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:myshop/data/models/custom_form.dart';
import 'package:myshop/managers/text.dart';
import 'package:myshop/ui/screen/authentication/otp_screen.dart';
import 'package:myshop/ui/widgets/common/custom%20form/custom_form.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        ),
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    TextManger.instance.resetPassword,
                    style: Theme.of(context).textTheme.headlineLarge,
                  )),
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: CustomForm(
                      formAction: () {
                        Get.to(OtpVerificationScreen());
                      },
                      formData: [
                        CustomFormModel(
                            controller: _emailEditingController,
                            hintText: TextManger.instance.emailHint),
                        CustomFormModel(
                            controller: _passwordEditingController,
                            hintText: TextManger.instance.passwordHint),
                      ],
                      buttonText: TextManger.instance.requestOpt),
                ),
              )
            ],
          ),
        )));
  }
}

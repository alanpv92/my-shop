import 'package:flutter/material.dart';
import 'package:myshop/managers/text.dart';
import 'package:myshop/data/models/custom_form.dart';
import 'package:myshop/ui/widgets/common/custom%20form/custom_form.dart';

class AuthBox extends StatefulWidget {
  const AuthBox({super.key});

  @override
  State<AuthBox> createState() => _AuthBoxState();
}

class _AuthBoxState extends State<AuthBox> {
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  late TextEditingController _userNameController;

  @override
  void initState() {
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _userNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  bool isReg = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
            width: constraints.maxWidth * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: CustomForm(
                          formAction: () {
                            //logic to call notifier
                          },
                          buttonText: isReg
                              ? TextManger.instance.register
                              : TextManger.instance.login,
                          formData: [
                            if (isReg)
                              CustomFormModel(
                                  controller: _userNameController,
                                  hintText: TextManger.instance.userNameHint),
                            CustomFormModel(
                                controller: _emailEditingController,
                                hintText: TextManger.instance.emailHint),
                            CustomFormModel(
                                controller: _passwordEditingController,
                                isPass: true,
                                hintText: TextManger.instance.passwordHint),
                          ]),
                    )),
                Align(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          _emailEditingController.clear();
                          _passwordEditingController.clear();
                          _userNameController.clear();
                          isReg = !isReg;
                        });
                      },
                      child: isReg
                          ? Text(
                              TextManger.instance.loginRedirect,
                              style: textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            )
                          : Text(
                              TextManger.instance.registerRedirect,
                              style: textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            )),
                )
              ],
            ));
      },
    );
  }
}

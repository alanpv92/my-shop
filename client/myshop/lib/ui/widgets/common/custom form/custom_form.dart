import 'package:flutter/material.dart';
import 'package:myshop/data/models/custom_form.dart';
import 'package:myshop/ui/widgets/animated/animated_button.dart';
import 'package:myshop/ui/widgets/common/custom%20form/custom_text_form_field.dart';

class CustomForm extends StatelessWidget {
  final List<CustomFormModel> formData;
  final String buttonText;
  final Function? formAction;
  final bool isLoading;
  CustomForm(
      {super.key,
      required this.formData,
      required this.buttonText,
      this.formAction,
      this.isLoading = false});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ...(formData
              .map((e) => Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(data: e),
                    ],
                  ))
              .toList()),
          const SizedBox(
            height: 10,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: double.infinity,
                  child: AnimatedButton(
                      buttonText: buttonText,
                      action: () {
                        if (formAction != null &&
                            _formKey.currentState!.validate()) {
                          formAction!();
                        }
                      })),
        ],
      ),
    );
  }
}

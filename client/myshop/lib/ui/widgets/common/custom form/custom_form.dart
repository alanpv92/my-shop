import 'package:flutter/material.dart';
import 'package:myshop/models/custom_form.dart';
import 'package:myshop/ui/widgets/common/custom%20form/custom_text_form_field.dart';

class CustomForm extends StatelessWidget {
  final List<CustomFormModel> formData;
  final String buttonText;
  const CustomForm({super.key, required this.formData,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    buttonText,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )))
      ],
    );
  }
}

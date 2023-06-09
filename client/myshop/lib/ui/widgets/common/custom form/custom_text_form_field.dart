import 'package:flutter/material.dart';
import 'package:myshop/models/custom_form.dart';

class CustomTextFormField extends StatefulWidget {
  final CustomFormModel data;
  const CustomTextFormField({super.key, required this.data});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isPassVisible;
  @override
  void initState() {
    isPassVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.data.isPass ? !isPassVisible : false,
      controller: widget.data.controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          suffixIcon: widget.data.isPass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPassVisible = !isPassVisible;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: isPassVisible ? Colors.blue : Colors.grey,
                  ))
              : null,
          hintText: widget.data.hintText,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}

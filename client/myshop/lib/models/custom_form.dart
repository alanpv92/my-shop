import 'package:flutter/material.dart';

class CustomFormModel {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  CustomFormModel(
      {required this.controller, required this.hintText, this.isPass = false});
}

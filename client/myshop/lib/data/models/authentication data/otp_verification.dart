import 'package:flutter/material.dart';
import 'package:myshop/data/models/authentication%20data/base.dart';

class OtpVerificationModel extends BaseAuthenticationDataModel {
  final List<TextEditingController> otp;
  OtpVerificationModel(
      {required super.email, required super.password, required this.otp});

 Map<String,String>  toMap() => {'email': email, 'newPassword': password, 'otp': otp.map((e) => e.text).join()};
}

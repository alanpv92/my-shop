

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/controllers/authentication.dart';
import 'package:myshop/data/models/authentication%20data/otp_verification.dart';
import 'package:myshop/managers/color.dart';

class OtpVerificationBox extends StatefulWidget {
  final FocusNode focusNode;
  final int currentIndex;
  final FocusNode? nextFocusNode;
  final TextEditingController textEditingController;
  final OtpVerificationModel? otpVerificationModel;

  const OtpVerificationBox(
      {super.key,
      required this.focusNode,
      required this.textEditingController,
      required this.currentIndex,
      this.nextFocusNode,
      this.otpVerificationModel});

  @override
  State<OtpVerificationBox> createState() => _OtpVerificationBoxState();
}

class _OtpVerificationBoxState extends State<OtpVerificationBox> {
  bool isValueIsFilled = false;
  @override
  Widget build(BuildContext context) {
    
    return Consumer(
      builder: (context, ref, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            controller: widget.textEditingController,
            focusNode: widget.focusNode,
            textAlign: TextAlign.center,
            onChanged: (value) {
              setState(() {
                isValueIsFilled = !isValueIsFilled;
              });
              if (value.isNotEmpty) {
                if (widget.currentIndex == 5) {
                  ref.watch(authControllerProvider.notifier).verifyOtp(
                      otpVerificationModel: widget.otpVerificationModel!);
                  return;
                }

                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              }
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: isValueIsFilled
                    ? ColorManager().primaryColor
                    : Colors.blueGrey),
          ),
        );
      },
    );
  }
}

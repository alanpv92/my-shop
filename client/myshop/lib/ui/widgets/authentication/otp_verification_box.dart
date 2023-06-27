import 'package:flutter/material.dart';
import 'package:myshop/managers/color.dart';

class OtpVerificationBox extends StatefulWidget {
  final FocusNode focusNode;
  final int currentIndex;
  final FocusNode? nextFocusNode;
  const OtpVerificationBox(
      {super.key,
      required this.focusNode,
      required this.currentIndex,
      this.nextFocusNode});

  @override
  State<OtpVerificationBox> createState() => _OtpVerificationBoxState();
}

class _OtpVerificationBoxState extends State<OtpVerificationBox> {
  bool isValueIsFilled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        focusNode: widget.focusNode,
        textAlign: TextAlign.center,
        onChanged: (value) {
          setState(() {
            isValueIsFilled = !isValueIsFilled;
          });
          if (value.isNotEmpty) {
            if (widget.currentIndex == 5) {
         
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
  }
}

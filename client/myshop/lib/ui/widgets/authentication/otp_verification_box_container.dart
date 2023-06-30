import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myshop/data/models/authentication%20data/base.dart';
import 'package:myshop/data/models/authentication%20data/otp_verification.dart';
import 'package:myshop/ui/widgets/authentication/otp_verification_box.dart';

class OtpVerificationBoxContainer extends StatefulWidget {
  final BaseAuthenticationDataModel baseAuthenticationDataModel;
  const OtpVerificationBoxContainer(
      {super.key, required this.baseAuthenticationDataModel});

  @override
  State<OtpVerificationBoxContainer> createState() =>
      _OtpVerificationBoxContainerState();
}

class _OtpVerificationBoxContainerState
    extends State<OtpVerificationBoxContainer> {
  late final TextEditingController _textEditingController1;
  late final TextEditingController _textEditingController2;
  late final TextEditingController _textEditingController3;
  late final TextEditingController _textEditingController4;
  late final TextEditingController _textEditingController5;
  late final TextEditingController _textEditingController6;

  late final FocusNode _otp1FocusNode;
  late final FocusNode _otp2FocusNode;
  late final FocusNode _otp3FocusNode;
  late final FocusNode _otp4FocusNode;
  late final FocusNode _otp5FocusNode;
  late final FocusNode _otp6FocusNode;
  late final List<FocusNode> _focusNodes;
  late final List<TextEditingController> _textEditingControllers;
  @override
  void initState() {
    _otp1FocusNode = FocusNode();
    _otp2FocusNode = FocusNode();
    _otp3FocusNode = FocusNode();
    _otp4FocusNode = FocusNode();
    _otp5FocusNode = FocusNode();
    _otp6FocusNode = FocusNode();
    _focusNodes = [
      _otp1FocusNode,
      _otp2FocusNode,
      _otp3FocusNode,
      _otp4FocusNode,
      _otp5FocusNode,
      _otp6FocusNode
    ];

    _textEditingController1 = TextEditingController();
    _textEditingController2 = TextEditingController();
    _textEditingController3 = TextEditingController();
    _textEditingController4 = TextEditingController();
    _textEditingController5 = TextEditingController();
    _textEditingController6 = TextEditingController();
    _textEditingControllers = [
      _textEditingController1,
      _textEditingController2,
      _textEditingController3,
      _textEditingController4,
      _textEditingController5,
      _textEditingController6
    ];
    super.initState();
  }

  @override
  void dispose() {
    _otp1FocusNode.dispose();
    _otp2FocusNode.dispose();
    _otp3FocusNode.dispose();
    _otp4FocusNode.dispose();
    _otp5FocusNode.dispose();
    _otp6FocusNode.dispose();
    _textEditingController1.dispose();
    _textEditingController2.dispose();
    _textEditingController3.dispose();
    _textEditingController4.dispose();
    _textEditingController5.dispose();
    _textEditingController6.dispose();

    _focusNodes.clear();
    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          6,
          (index) => Expanded(
                  child: OtpVerificationBox(
                textEditingController: _textEditingControllers[index],
                currentIndex: index,
                focusNode: _focusNodes[index],
                otpVerificationModel: index == 5
                    ? OtpVerificationModel(
                        email: widget.baseAuthenticationDataModel.email,
                        password: widget.baseAuthenticationDataModel.password,
                        otp: _textEditingControllers)
                    : null,
                nextFocusNode: index != 5 ? _focusNodes[index + 1] : null,
              ))),
    );
  }
}

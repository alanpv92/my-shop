import 'package:flutter/material.dart';
import 'package:myshop/ui/widgets/authentication/otp_verification_box.dart';

class OtpVerificationBoxContainer extends StatefulWidget {
  const OtpVerificationBoxContainer({super.key});

  @override
  State<OtpVerificationBoxContainer> createState() =>
      _OtpVerificationBoxContainerState();
}

class _OtpVerificationBoxContainerState
    extends State<OtpVerificationBoxContainer> {
  late final FocusNode _otp1FocusNode;
  late final FocusNode _otp2FocusNode;
  late final FocusNode _otp3FocusNode;
  late final FocusNode _otp4FocusNode;
  late final FocusNode _otp5FocusNode;
  late final FocusNode _otp6FocusNode;
  late final List<FocusNode> _focusNodes;
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
                currentIndex: index,
                focusNode: _focusNodes[index],
                nextFocusNode: index != 5 ? _focusNodes[index + 1] : null,
              ))),
    );
  }
}
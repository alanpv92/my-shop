import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ErrorToast {
  final String message;
  ErrorToast(this.message);

  void showError() {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 20,
   
    );
  }
}

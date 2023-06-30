import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SucessToast {
  final String message;
  SucessToast(this.message);

  void showSucess() {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 20,
   
    );
  }
}

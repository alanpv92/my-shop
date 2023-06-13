import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("welcome",style: TextStyle(
          color: Colors.black
        ),),
      ),
    );
  }
}

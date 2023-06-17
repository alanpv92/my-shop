import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/controllers/authentication.dart';

class Dash extends ConsumerWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: ref.read(authControllerProvider.notifier).logOut,
          child: Text("welcome",style: TextStyle(
            color: Colors.black
          ),),
        ),
      ),
    );
  }
}

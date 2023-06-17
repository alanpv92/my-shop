import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/controllers/app.dart';
import 'package:myshop/ui/widgets/authentication/auth_manager.dart';

class AppLoaderScreen extends ConsumerWidget {
  const AppLoaderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder(
          future: ref.read(appControllerProvider.notifier).loadAppData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const AuthManager();
            }
            return Center(
              child: SizedBox(
                  width: constraints.maxWidth * .6,
                  height: 10,
                  child: const LinearProgressIndicator()),
            );
          },
        );
      },
    )));
  }
}

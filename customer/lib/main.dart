

import 'package:customer/services/firebase/firebase.dart';

import 'common_export.dart';

void main(List<String> args) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await DotEnvService.instance.init();
  await FirebaseService.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TSize.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnBoardingController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthenticationController(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigatorService.instance.navigatorKey,
        onGenerateRoute: NavigatorService.instance.generateRoutes,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TTheme.light,
        darkTheme: TTheme.dark,
      ),
    );
  }
}

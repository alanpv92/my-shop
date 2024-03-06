import 'package:customer/services/navigator/routes.dart';
import 'package:customer/themes/theme.dart';

import 'common_export.dart';

void main(List<String> args) {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      navigatorKey: NavigatorService.instance.navigatorKey,
      onGenerateRoute: NavigatorService.instance.generateRoutes,
      themeMode: ThemeMode.system,
      theme: TTheme.light,
      darkTheme: TTheme.dark,
    );
  }
}

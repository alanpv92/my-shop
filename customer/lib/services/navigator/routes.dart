import 'package:customer/common_export.dart';

class NavigatorService {
  NavigatorService._();
  static NavigatorService instance = NavigatorService._();
  factory NavigatorService() {
    return instance;
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final Map<Routes, String> routePaths = {Routes.onboarding: "/onboarding"};

  String get initialRoute => Routes.onboarding.routePath;

  Future<T?>? push<T extends Object?>(Routes route, {Object? arguments}) {
    return navigatorKey.currentState
        ?.pushNamed<T>(route.routePath, arguments: arguments);
  }

  Future<dynamic>? pushReplacement(Routes route, {Object? arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(route.routePath, arguments: arguments);
  }

  Future<void> pop<T extends Object?>([T? result]) async {
    // Completer<void> completer = Completer<void>();

    navigatorKey.currentState?.pop(result);
    // completer.complete();

    // return completer.future;
  }

  bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  void popUntil({Routes? route}) {
    navigatorKey.currentState?.popUntil((r) {
      if (route != null) {
        return r.settings.name == route.routePath;
      }
      return r.isFirst;
    });
  }

  Future<T?>? pushAndRemoveUntil<T extends Object?>(Routes route,
      {Object? arguments}) {
    return navigatorKey.currentState
        ?.pushNamedAndRemoveUntil<T>(route.routePath, (route) => false);
  }

  Route<dynamic> generateRoutes(RouteSettings settings) {
    if (settings.name == Routes.onboarding.routePath || settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => const OboardingScreen(),
      );
    }

    //temp should be changed
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("Page not found"),
        ),
      ),
    );
  }
}

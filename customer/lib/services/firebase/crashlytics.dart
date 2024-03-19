import 'package:customer/common_export.dart';

class FirebaseCrashlyticsService {
  FirebaseCrashlyticsService._();
  static FirebaseCrashlyticsService instance = FirebaseCrashlyticsService._();
  factory FirebaseCrashlyticsService() => instance;

  Future<void> init() async {
    try {
      if (kDebugMode) {
        FlutterError.onError = (errorDetails) {
          FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        };
        // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
        PlatformDispatcher.instance.onError = (error, stack) {
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          return true;
        };
      }
    } catch (e) {
      log("firebase crashlytics has been failed");
    }
  }
}

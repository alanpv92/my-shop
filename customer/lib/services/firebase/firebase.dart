import 'package:customer/common_export.dart';

class FirebaseService {
  FirebaseService._();
  static FirebaseService instance = FirebaseService._();
  factory FirebaseService() {
    return instance;
  }

  Future<void> init() async {
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await FirebaseCrashlyticsService.instance.init();
    } catch (e) {
      log("firebase not initialized properly");
    }
  }
}

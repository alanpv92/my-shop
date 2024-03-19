import 'package:customer/common_export.dart';

class DotEnvService {
  DotEnvService._();
  static DotEnvService instance = DotEnvService._();
  factory DotEnvService() => instance;

  Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  String getValue(String key) {
    return dotenv.env[key] ?? '';
  }
}

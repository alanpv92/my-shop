import 'package:customer/common_export.dart';
import 'package:customer/services/navigator/routes.dart';

extension GetPath on Routes {
  String get routePath => NavigatorService.instance.routePaths[this] ?? "/";
}
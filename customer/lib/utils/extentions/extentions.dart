import 'package:customer/common_export.dart';


extension GetPath on Routes {
  String get routePath => NavigatorService.instance.routePaths[this] ?? "/";
}
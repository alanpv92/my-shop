import 'package:customer/common_export.dart';

class OnBoardingController extends ChangeNotifier {
 
  final List<String> _assets = [
    TAssets.onboarding1LottieAnimation,
    TAssets.onboarding2LottieAnimation,
    TAssets.onboarding3LottieAnimation,
  ];
  final List<String> _titles = [
    TStrings.onboarding1Tittle,
    TStrings.onboarding2Tittle,
    TStrings.onboarding3Tittle,
  ];
  final List<String> _descriptions = [
    TStrings.onboarding1Desc,
    TStrings.onboarding2Desc,
    TStrings.onboarding3Desc,
  ];

  List<String> get assets => _assets;
  List<String> get titles => _titles;
  List<String> get descriptions => _descriptions;
}

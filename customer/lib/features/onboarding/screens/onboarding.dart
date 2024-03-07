import 'package:customer/common_export.dart';
import 'package:customer/constants/sizes.dart';

class OboardingScreen extends StatelessWidget {
  const OboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(TPadding.md),
          child: Column(
            children: [
              Lottie.asset(TAssets.onboarding1LottieAnimation,
                  fit: BoxFit.contain),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Choose from a variety of products",
                    style: theme.textTheme.headlineMedium,
                  ),
                  VGap(TGaps.md),
                  Text(
                    'Explore a comprehensive array of products, and elevate your choices from our diverse and appealing range of options, ensuring satisfaction in every selection with our wide variety of offerings.',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  VGap(TGaps.md),
                  SizedBox(
                    width: double.infinity,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Next')),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

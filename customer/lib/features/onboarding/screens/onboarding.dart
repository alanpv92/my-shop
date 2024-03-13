import 'package:customer/common_export.dart';

class OboardingScreen extends StatefulWidget {
  const OboardingScreen({super.key});

  @override
  State<OboardingScreen> createState() => _OboardingScreenState();
}

class _OboardingScreenState extends State<OboardingScreen> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = 1;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FlutterNativeSplash.remove();
    });
    super.initState();
  }

  changeIndex() {
    if (currentIndex !=
        context.read<OnBoardingController>().assets.length - 1) {
      currentIndex++;
      setState(() {});
    } else {
      NavigatorService.instance.pushReplacement(Routes.authentication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onBoardingController = context.read<OnBoardingController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(TPadding.md),
          child: Column(
            children: [
              VGap(TGaps.xxl),
              Lottie.asset(
                onBoardingController.assets[currentIndex],
                fit: BoxFit.contain,
                height: TSize.h * 30,
                width: double.infinity,
                frameRate: FrameRate.max,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          onBoardingController.titles[currentIndex],
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      VGap(TGaps.md),
                      Text(
                        onBoardingController.descriptions[currentIndex],
                        style: theme.textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  BouncingElevatedButton(
                    text: TStrings.kNext,
                    onPressed: () {
                      changeIndex();
                    },
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

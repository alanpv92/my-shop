import 'package:customer/common_export.dart';

class HGap extends StatelessWidget {
  final double width;
  const HGap(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class VGap extends StatelessWidget {
  final double height;
  const VGap(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}


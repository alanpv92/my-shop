import 'package:customer/common_export.dart';

class BouncingElevatedButton extends StatefulWidget {
  final String text;
  final bool shouldBounce;
  final void Function()? onPressed;
  const BouncingElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.shouldBounce = true});

  @override
  State<BouncingElevatedButton> createState() => _BouncingElevatedButtonState();
}

class _BouncingElevatedButtonState extends State<BouncingElevatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    if (widget.shouldBounce) {}
    if (widget.shouldBounce) {
      _animationController.forward();
      _animationController.repeat(reverse: true);
    }

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -8 * _animation.value),
          child: child,
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: widget.onPressed, child: Text(widget.text)),
      ),
    );
  }
}

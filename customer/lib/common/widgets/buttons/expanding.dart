import 'package:customer/common_export.dart';


class ExpandingButton extends StatefulWidget {
  final String text;
  final bool shouldExpand;
  final void Function()? onPressed;
  const ExpandingButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.shouldExpand = true});

  @override
  State<ExpandingButton> createState() => _ExpandingButtonState();
}

class _ExpandingButtonState extends State<ExpandingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 60000));
    _animation =
        Tween<double>(begin: 1, end: 1.2).animate(_animationController);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(scale: _animation.value, child: child!);
          },
          child: SizedBox(
              width: constraints.maxWidth * .9,
              child: ElevatedButton(
                  onPressed: () {
                    if (widget.shouldExpand) {
                      _animationController.forward();
                    }

                    widget.onPressed?.call();
                  },
                  child: Text(widget.text))),
        );
      },
    );
  }
}

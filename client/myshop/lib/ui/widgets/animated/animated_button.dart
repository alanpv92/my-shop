import 'dart:developer';

import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String buttonText;
  final Function action;
  const AnimatedButton(
      {super.key, required this.buttonText, required this.action});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation =
        Tween<double>(begin: 1, end: 1.1).animate(_animationController);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
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
        return Transform.scale(
          scale: _animation.value,
          alignment: Alignment.center,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () async {
                _animationController.forward();
                await Future.delayed(const Duration(milliseconds: 200));
                widget.action();
              },
              child: Text(
                widget.buttonText,
                style: Theme.of(context).textTheme.labelMedium,
              )),
        );
      },
    );
  }
}

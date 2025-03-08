import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required Animation<Offset> slidinganimation,
  }) : _slidinganimation = slidinganimation;

  final Animation<Offset> _slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slidinganimation,
      builder: (context, _) {
        return SlideTransition(
          position: _slidinganimation,
          child: Text(
            'Read free books',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

dynamic animatePageTransition(BuildContext context, Widget child) {
  return PageTransitionSwitcher(
    duration: const Duration(milliseconds: 400),
    transitionBuilder: (child, animation, secondaryAnimation) {
      return FadeThroughTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        fillColor: Theme.of(context).colorScheme.surface,
        child: child,
      );
    },
    child: child
  );
}

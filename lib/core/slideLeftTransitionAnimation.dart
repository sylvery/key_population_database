import 'package:flutter/cupertino.dart';

PageRouteBuilder slideLeftTransitionAnimation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Starting position (from right)
      const end = Offset.zero; // Ending position (center)
      const curve = Curves.fastEaseInToSlowEaseOut; // Animation curve

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

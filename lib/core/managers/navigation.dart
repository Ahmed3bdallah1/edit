import 'package:flutter/material.dart';

void navigateToNextScreen(BuildContext context, Widget page) =>
    Navigator.of(context).push(customPageRouteTransition(page));

void navigateAndFinishThisScreen(BuildContext context, widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

void navigateAndReplace(BuildContext context, Widget page) =>
    Navigator.pushReplacement(context, customPageRouteTransition(page));

PageRouteBuilder customPageRouteTransition(Widget page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 600)
  );
}
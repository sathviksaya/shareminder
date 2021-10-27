import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void pushPage(
  BuildContext context,
  Widget page, {
  PageTransitionType transitionType = PageTransitionType.rightToLeft,
}) {
  Navigator.push(
    context,
    PageTransition(
      type: transitionType,
      child: page,
    ),
  );
}

void replacePage(
  BuildContext context,
  Widget page, {
  PageTransitionType transitionType = PageTransitionType.rightToLeft,
}) {
  Navigator.pushReplacement(
    context,
    PageTransition(
      type: transitionType,
      child: page,
    ),
  );
}

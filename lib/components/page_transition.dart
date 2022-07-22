import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PageRouteBuilder slideRightToLeft(Widget page){
  return PageRouteBuilder(
    pageBuilder: (c, a1, a2) => page,
    transitionsBuilder: (c, anim, a2, child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(anim),
      child: child,
    ),
    transitionDuration: Duration(milliseconds: 300),
  );
}

PageRouteBuilder fadeOut(Widget page){
  return PageRouteBuilder(
    pageBuilder: (c, a1, a2) => page,
    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child,),
    transitionDuration: Duration(milliseconds: 300),
  );
}
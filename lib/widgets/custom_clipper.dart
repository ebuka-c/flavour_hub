import 'package:flutter/material.dart';

class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * -0.0243333, size.height * -0.0091706);
    path.lineTo(size.width * 1.0025641, 0);
    path.quadraticBezierTo(
      size.width * 1.0747949,
      size.height * 0.5345261,
      size.width * 1.4076154,
      size.height * 0.6585545,
    );
    path.cubicTo(
      size.width * 0.6642564,
      size.height * 0.5719668,
      size.width * 0.5820513,
      size.height * 1.2325355,
      size.width * -0.0681795,
      size.height * 0.7562559,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

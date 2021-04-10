import 'package:flutter/material.dart';
import 'dart:core';

class BubblePainter extends CustomPainter {
  final Color color;
  final Rect rect;

  BubblePainter({
    required this.color,
    required this.rect,
  });

  var paint1 = Paint()
    ..color = Color(0xff63aa65)
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.addOval(rect);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RipplePaint extends CustomPainter {
  final Animation<double> animation;
  // final AnimationController animation;
  final Color color;

  RipplePaint({
    required this.animation,
    required this.color,
  });

  //draw circle

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(0, 0);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(center, animation.value, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:unitools/core/common/app_colors.dart';

class BackgroundShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = AppColors.mainColor;
    canvas.drawCircle(
      Offset(
        size.width * 0.25,
        0,
      ),
      size.width / 3.45,
      paint,
    );
    canvas.drawCircle(
      Offset(
        0,
        size.width * 0.25,
      ),
      size.width / 3.45,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

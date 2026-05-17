import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mood_tracker/presentation/widgets/painters/base_mood_painter.dart';

class ExcitedMoodPainter extends BaseMoodPainter {
  ExcitedMoodPainter(super.config);

  @override
  void drawMouth(Canvas canvas, Offset center, double radius, Paint paint) {
    final mouthWidth = radius * 1.0;
    final mouthHeight = radius * 0.6;
    final rect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + radius * 0.25),
      width: mouthWidth,
      height: mouthHeight,
    );
    // Wide open arc (outer)
    final start = pi * 0.05;
    final sweep = pi - pi * 0.1;
    final outerPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = paint.strokeWidth;
    canvas.drawArc(rect, start, sweep, false, outerPaint);

    // Small inner filled arc to suggest open mouth
    final innerRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + radius * 0.28),
      width: mouthWidth * 0.6,
      height: mouthHeight * 0.5,
    );
    final fillPaint = Paint()..color = Colors.black;
    canvas.drawArc(innerRect, start, sweep, false, fillPaint..style = PaintingStyle.fill);
  }

  @override
  void drawEyebrows(Canvas canvas, Offset center, double radius, Paint paint) {
    final browWidth = radius * 0.45;
    final browY = center.dy - radius * 0.75;
    final leftStart = Offset(center.dx - radius * 0.5 - browWidth / 2, browY);
    final leftEnd = Offset(leftStart.dx + browWidth, browY - browWidth * 0.2);
    final rightStart = Offset(center.dx + radius * 0.5 - browWidth / 2, browY - browWidth * 0.2);
    final rightEnd = Offset(rightStart.dx + browWidth, browY);
    // Raised high
    canvas.drawLine(leftStart, leftEnd, paint);
    canvas.drawLine(rightStart, rightEnd, paint);
  }
}


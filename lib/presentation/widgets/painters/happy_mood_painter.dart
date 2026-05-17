import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';
import 'package:mood_tracker/presentation/widgets/painters/base_mood_painter.dart';

class HappyMoodPainter extends BaseMoodPainter {
  HappyMoodPainter(MoodConfig config) : super(config);

  @override
  void drawMouth(Canvas canvas, Offset center, double radius, Paint paint) {
    final mouthWidth = radius * 0.9;
    final mouthHeight = radius * 0.45;
    final rect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + radius * 0.25),
      width: mouthWidth,
      height: mouthHeight,
    );
    // Smile: upward arc
    final start = pi * 0.15;
    final sweep = pi - pi * 0.3;
    canvas.drawArc(rect, start, sweep, false, paint);
  }

  @override
  void drawEyebrows(Canvas canvas, Offset center, double radius, Paint paint) {
    final browWidth = radius * 0.35;
    final browY = center.dy - radius * 0.65;
    final leftStart = Offset(center.dx - radius * 0.5 - browWidth / 2, browY);
    final leftEnd = Offset(leftStart.dx + browWidth, browY);
    final rightStart = Offset(center.dx + radius * 0.5 - browWidth / 2, browY);
    final rightEnd = Offset(rightStart.dx + browWidth, browY);
    // Slightly raised flat lines
    canvas.drawLine(leftStart, leftEnd, paint);
    canvas.drawLine(rightStart, rightEnd, paint);
  }
}


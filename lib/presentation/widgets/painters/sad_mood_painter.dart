import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';
import 'package:mood_tracker/presentation/widgets/painters/base_mood_painter.dart';

class SadMoodPainter extends BaseMoodPainter {
  SadMoodPainter(MoodConfig config) : super(config);

  @override
  void drawMouth(Canvas canvas, Offset center, double radius, Paint paint) {
    final mouthWidth = radius * 0.7;
    final mouthHeight = radius * 0.45;
    final rect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + radius * 0.5),
      width: mouthWidth,
      height: mouthHeight,
    );
    // Frown: downward arc (invert by starting at pi and sweeping -pi)
    final start = -pi * 0.15;
    final sweep = -(pi - pi * 0.3);
    canvas.drawArc(rect, start, sweep, false, paint);
  }

  @override
  void drawEyebrows(Canvas canvas, Offset center, double radius, Paint paint) {
    // Angled downward toward center
    final browLength = radius * 0.35;
    final leftStart = Offset(center.dx - radius * 0.85, center.dy - radius * 0.6);
    final leftEnd = Offset(leftStart.dx + browLength, leftStart.dy + browLength * 0.35);
    final rightStart = Offset(center.dx + radius * 0.85, center.dy - radius * 0.6);
    final rightEnd = Offset(rightStart.dx - browLength, rightStart.dy + browLength * 0.35);
    canvas.drawLine(leftStart, leftEnd, paint);
    canvas.drawLine(rightStart, rightEnd, paint);
  }
}


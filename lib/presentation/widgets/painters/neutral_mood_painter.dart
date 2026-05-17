import 'package:flutter/material.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';
import 'package:mood_tracker/presentation/widgets/painters/base_mood_painter.dart';

class NeutralMoodPainter extends BaseMoodPainter {
  NeutralMoodPainter(MoodConfig config) : super(config);

  @override
  void drawMouth(Canvas canvas, Offset center, double radius, Paint paint) {
    final mouthWidth = radius * 0.6;
    final mouthY = center.dy + radius * 0.35;
    final p1 = Offset(center.dx - mouthWidth / 2, mouthY);
    final p2 = Offset(center.dx + mouthWidth / 2, mouthY);
    canvas.drawLine(p1, p2, paint);
  }

  @override
  void drawEyebrows(Canvas canvas, Offset center, double radius, Paint paint) {
    final browWidth = radius * 0.35;
    final browY = center.dy - radius * 0.5;
    final leftStart = Offset(center.dx - radius * 0.5 - browWidth / 2, browY);
    final leftEnd = Offset(leftStart.dx + browWidth, browY);
    final rightStart = Offset(center.dx + radius * 0.5 - browWidth / 2, browY);
    final rightEnd = Offset(rightStart.dx + browWidth, browY);
    // Flat eyebrows
    canvas.drawLine(leftStart, leftEnd, paint);
    canvas.drawLine(rightStart, rightEnd, paint);
  }
}


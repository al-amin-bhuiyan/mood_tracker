import 'package:flutter/material.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';
import 'package:mood_tracker/presentation/widgets/painters/base_mood_painter.dart';

class AnxiousMoodPainter extends BaseMoodPainter {
  AnxiousMoodPainter(MoodConfig config) : super(config);

  @override
  void drawMouth(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    final startX = center.dx - radius * 0.45;
    final y = center.dy + radius * 0.35;
    path.moveTo(startX, y);
    // Wavy mouth with multiple control points
    path.relativeQuadraticBezierTo(radius * 0.15, -radius * 0.15, radius * 0.3, 0);
    path.relativeQuadraticBezierTo(radius * 0.15, radius * 0.15, radius * 0.3, 0);
    canvas.drawPath(path, paint);
  }

  @override
  void drawEyebrows(Canvas canvas, Offset center, double radius, Paint paint) {
    // Angled sharply inward
    final leftStart = Offset(center.dx - radius * 0.9, center.dy - radius * 0.6);
    final leftEnd = Offset(center.dx - radius * 0.55, center.dy - radius * 0.5);
    final rightStart = Offset(center.dx + radius * 0.9, center.dy - radius * 0.6);
    final rightEnd = Offset(center.dx + radius * 0.55, center.dy - radius * 0.5);
    canvas.drawLine(leftStart, leftEnd, paint);
    canvas.drawLine(rightStart, rightEnd, paint);
  }
}


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';

/// Abstract base painter for mood faces.
/// Subclasses should implement only the mouth and eyebrows drawing.
abstract class BaseMoodPainter extends CustomPainter {
  final MoodConfig config;

  BaseMoodPainter(this.config);

  /// Draws the mouth for the face.
  void drawMouth(Canvas canvas, Offset center, double radius, Paint paint);

  /// Draws the eyebrows for the face.
  void drawEyebrows(Canvas canvas, Offset center, double radius, Paint paint);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) * 0.4;

    // Face circle
    final facePaint = Paint()..color = config.backgroundColor;
    canvas.drawCircle(center, radius, facePaint);

    // Face outline
    final outlinePaint = Paint()
      ..color = config.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = max(2.0, radius * 0.05);
    canvas.drawCircle(center, radius, outlinePaint);

    // Eyes
    final eyePaint = Paint()..color = Colors.black;
    final eyeOffsetX = radius * 0.5;
    final eyeOffsetY = -radius * 0.2;
    final eyeRadius = max(2.0, radius * 0.09);
    final leftEye = Offset(center.dx - eyeOffsetX, center.dy + eyeOffsetY);
    final rightEye = Offset(center.dx + eyeOffsetX, center.dy + eyeOffsetY);
    canvas.drawCircle(leftEye, eyeRadius, eyePaint);
    canvas.drawCircle(rightEye, eyeRadius, eyePaint);

    // Delegate variable parts to subclasses
    final featurePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = max(2.0, radius * 0.06)
      ..strokeCap = StrokeCap.round;

    drawMouth(canvas, center, radius, featurePaint);
    drawEyebrows(canvas, center, radius, featurePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


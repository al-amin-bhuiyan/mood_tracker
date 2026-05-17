import 'package:flutter/material.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';
import 'package:mood_tracker/core/constants/mood_type.dart';
import 'package:mood_tracker/presentation/widgets/painters/base_mood_painter.dart';

/// Factory that creates a painter for a given [MoodType].
class MoodPainterFactory {
  MoodPainterFactory._();

  static CustomPainter create(MoodType type) {
    final config = MoodConfig.fromType(type);
    // Placeholder concrete implementation using the BaseMoodPainter template.
    // Subclasses will provide expressive mouths/eyebrows later.
    return _DefaultMoodPainter(config);
  }
}

class _DefaultMoodPainter extends BaseMoodPainter {
  _DefaultMoodPainter(MoodConfig config) : super(config);

  @override
  void drawMouth(Canvas canvas, Offset center, double radius, Paint paint) {
    // Simple straight mouth for placeholder
    final mouthWidth = radius * 0.6;
    final mouthY = center.dy + radius * 0.35;
    final p1 = Offset(center.dx - mouthWidth / 2, mouthY);
    final p2 = Offset(center.dx + mouthWidth / 2, mouthY);
    canvas.drawLine(p1, p2, paint);
  }

  @override
  void drawEyebrows(Canvas canvas, Offset center, double radius, Paint paint) {
    // Simple short eyebrows placeholder
    final browWidth = radius * 0.3;
    final browY = center.dy - radius * 0.45;
    final leftStart = Offset(center.dx - radius * 0.5 - browWidth / 2, browY);
    final leftEnd = Offset(leftStart.dx + browWidth, browY);
    final rightStart = Offset(center.dx + radius * 0.5 - browWidth / 2, browY);
    final rightEnd = Offset(rightStart.dx + browWidth, browY);
    canvas.drawLine(leftStart, leftEnd, paint);
    canvas.drawLine(rightStart, rightEnd, paint);
  }
}


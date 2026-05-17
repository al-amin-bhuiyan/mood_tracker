import 'package:flutter/material.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';
import 'package:mood_tracker/core/constants/mood_type.dart';
import 'package:mood_tracker/presentation/widgets/painters/base_mood_painter.dart';
import 'package:mood_tracker/presentation/widgets/painters/happy_mood_painter.dart';
import 'package:mood_tracker/presentation/widgets/painters/neutral_mood_painter.dart';
import 'package:mood_tracker/presentation/widgets/painters/sad_mood_painter.dart';
import 'package:mood_tracker/presentation/widgets/painters/excited_mood_painter.dart';
import 'package:mood_tracker/presentation/widgets/painters/anxious_mood_painter.dart';

/// Factory that creates a painter for a given [MoodType].
class MoodPainterFactory {
  MoodPainterFactory._();

  static CustomPainter create(MoodType type) {
    final config = MoodConfig.fromType(type);
    switch (type) {
      case MoodType.happy:
        return HappyMoodPainter(config);
      case MoodType.neutral:
        return NeutralMoodPainter(config);
      case MoodType.sad:
        return SadMoodPainter(config);
      case MoodType.excited:
        return ExcitedMoodPainter(config);
      case MoodType.anxious:
        return AnxiousMoodPainter(config);
    }
  }
}



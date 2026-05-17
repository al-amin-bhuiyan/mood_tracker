import 'package:flutter/material.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';
import 'package:mood_tracker/core/constants/mood_type.dart';
import 'package:mood_tracker/presentation/widgets/painters/mood_painter_factory.dart';

class MoodFaceWidget extends StatelessWidget {
  final MoodType moodType;
  final double size;

  const MoodFaceWidget({
    super.key,
    required this.moodType,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final config = MoodConfig.fromType(moodType);
    final painter = MoodPainterFactory.create(moodType);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: config.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: CustomPaint(
        painter: painter,
        size: Size(size, size),
      ),
    );
  }
}


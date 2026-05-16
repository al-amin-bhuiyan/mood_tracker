import 'package:flutter/material.dart';

enum MoodType {
  happy,
  neutral,
  sad,
  excited,
  anxious,
}

class MoodConfig {
  final Color primaryColor;
  final Color backgroundColor;
  final String label;
  final double mouthCurve;
  final double eyebrowAngle;

  const MoodConfig._({
    required this.primaryColor,
    required this.backgroundColor,
    required this.label,
    required this.mouthCurve,
    required this.eyebrowAngle,
  });

  factory MoodConfig.fromType(MoodType type) {
    switch (type) {
      case MoodType.happy:
        return const MoodConfig._(
          primaryColor: Color(0xFFFFC107),
          backgroundColor: Color(0xFFFFF8E1),
          label: 'Happy',
          mouthCurve: 1.0,
          eyebrowAngle: -0.15,
        );
      case MoodType.neutral:
        return const MoodConfig._(
          primaryColor: Color(0xFF78909C),
          backgroundColor: Color(0xFFF5F5F5),
          label: 'Neutral',
          mouthCurve: 0.0,
          eyebrowAngle: 0.0,
        );
      case MoodType.sad:
        return const MoodConfig._(
          primaryColor: Color(0xFF42A5F5),
          backgroundColor: Color(0xFFE3F2FD),
          label: 'Sad',
          mouthCurve: -1.0,
          eyebrowAngle: 0.2,
        );
      case MoodType.excited:
        return const MoodConfig._(
          primaryColor: Color(0xFFAB47BC),
          backgroundColor: Color(0xFFF3E5F5),
          label: 'Excited',
          mouthCurve: 1.2,
          eyebrowAngle: -0.25,
        );
      case MoodType.anxious:
        return const MoodConfig._(
          primaryColor: Color(0xFFEF5350),
          backgroundColor: Color(0xFFFFEBEE),
          label: 'Anxious',
          mouthCurve: -0.6,
          eyebrowAngle: 0.35,
        );
    }
  }
}

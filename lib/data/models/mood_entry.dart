import 'package:mood_tracker/core/constants/mood_type.dart';

class MoodEntry {
  final String id;
  final MoodType moodType;
  final DateTime loggedAt;

  const MoodEntry({
    required this.id,
    required this.moodType,
    required this.loggedAt,
  });

  factory MoodEntry.create(MoodType moodType) {
    final now = DateTime.now();
    return MoodEntry(
      id: now.millisecondsSinceEpoch.toString(),
      moodType: moodType,
      loggedAt: now,
    );
  }

  MoodEntry copyWith({String? id, MoodType? moodType, DateTime? loggedAt}) {
    return MoodEntry(
      id: id ?? this.id,
      moodType: moodType ?? this.moodType,
      loggedAt: loggedAt ?? this.loggedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'moodType': moodType.name,
      'loggedAt': loggedAt.toIso8601String(),
    };
  }

  factory MoodEntry.fromMap(Map<String, dynamic> map) {
    return MoodEntry(
      id: map['id'] as String,
      moodType: MoodType.values.firstWhere((e) => e.name == (map['moodType'] as String)),
      loggedAt: DateTime.parse(map['loggedAt'] as String),
    );
  }
}


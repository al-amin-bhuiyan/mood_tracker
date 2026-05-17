import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/presentation/controllers/mood_controller.dart';
import 'package:mood_tracker/data/models/mood_entry.dart';
import 'package:mood_tracker/presentation/widgets/mood_face_widget.dart';
import 'package:mood_tracker/core/constants/mood_config.dart';

class MoodTimeline extends StatelessWidget {
  const MoodTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MoodController>(
      builder: (controller) {
        final entries = controller.entries;
        if (entries.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Center(
              child: Text(
                'No moods logged yet. Tap a face above!',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          );
        }

        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: entries.length,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: _MoodTimelineCard(entry: entry),
              );
            },
          ),
        );
      },
    );
  }
}

class _MoodTimelineCard extends StatelessWidget {
  final MoodEntry entry;

  const _MoodTimelineCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final config = MoodConfig.fromType(entry.moodType);
    final dateLabel = DateFormat('MMM d').format(entry.loggedAt);

    return Container(
      width: 160,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          MoodFaceWidget(moodType: entry.moodType, size: 50),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  config.label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  dateLabel,
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


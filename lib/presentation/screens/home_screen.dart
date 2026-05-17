import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mood_tracker/core/constants/mood_type.dart';
import 'package:mood_tracker/presentation/controllers/mood_controller.dart';
import 'package:mood_tracker/presentation/widgets/mood_face_widget.dart';
import 'package:mood_tracker/presentation/widgets/mood_timeline.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MoodController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Text(
                'How are you feeling?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              // Mood selection row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final moodType in MoodType.values)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.logMood(moodType);
                            Get.snackbar(
                              'Mood Logged',
                              'You logged: ${moodType.name}',
                              duration: const Duration(seconds: 2),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: MoodFaceWidget(
                              moodType: moodType,
                              size: 80,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 12),
              const MoodTimeline(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}


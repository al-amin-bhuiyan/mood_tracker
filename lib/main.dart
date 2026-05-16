import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mood_tracker/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mood Tracker',
      theme: AppTheme.lightTheme(),
      home: const Scaffold(
        body: SizedBox.expand(
          child: ColoredBox(color: Colors.white),
        ),
      ),
    );
  }
}

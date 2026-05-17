import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mood_tracker/core/theme/app_theme.dart';
import 'package:mood_tracker/bindings/app_binding.dart';
import 'package:mood_tracker/presentation/screens/home_screen.dart';

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
      initialBinding: AppBinding(),
      home: const HomeScreen(),
    );
  }
}

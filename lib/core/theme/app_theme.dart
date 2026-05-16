import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /// Light theme configuration.
  /// Soft off-white background, deep purple primary, and a clean sans-serif font.
  static ThemeData lightTheme() {
	final colorScheme = ColorScheme.fromSeed(
	  seedColor: Colors.deepPurple,
	  brightness: Brightness.light,
	);

	return ThemeData(
	  useMaterial3: true,
	  colorScheme: colorScheme,
	  primaryColor: colorScheme.primary,
	  scaffoldBackgroundColor: const Color(0xFFFBFAF8),
	  fontFamily: 'Roboto',
	  appBarTheme: AppBarTheme(
		backgroundColor: colorScheme.primary,
		foregroundColor: colorScheme.onPrimary,
	  ),
	);
  }
}

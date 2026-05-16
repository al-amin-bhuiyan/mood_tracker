// Single Responsibility: app-wide constants only
class AppConstants {
  AppConstants._(); // Private constructor to prevent instantiation

  static const String appName = 'Mood Tracker';
  static const int maxTimelineEntries = 7;
  static const int animationDurationMs = 300;
}

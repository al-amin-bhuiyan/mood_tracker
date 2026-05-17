// Abstract repository contract for mood entries.
// Follows the Dependency Inversion Principle: higher-level modules
// depend on this abstraction rather than concrete implementations.

import 'package:mood_tracker/data/models/mood_entry.dart';

abstract class IMoodRepository {
  /// Returns all stored mood entries.
  List<MoodEntry> getEntries();

  /// Adds a new mood entry.
  void addEntry(MoodEntry entry);

  /// Clears all stored entries.
  void clearAll();

  /// Returns the most recent [n] entries (or fewer if not available).
  List<MoodEntry> getLastN(int n);
}


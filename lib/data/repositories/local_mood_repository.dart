// In-memory local repository implementation for mood entries.
// Pure data layer: no Flutter, GetX, or UI dependencies.

import 'package:mood_tracker/data/models/mood_entry.dart';
import 'package:mood_tracker/domain/abstractions/i_mood_repository.dart';

class LocalMoodRepository implements IMoodRepository {
  final List<MoodEntry> _entries = [];

  LocalMoodRepository();

  @override
  List<MoodEntry> getEntries() => List.unmodifiable(_entries);

  @override
  void addEntry(MoodEntry entry) {
    // newest entries at the front
    _entries.insert(0, entry);
  }

  @override
  void clearAll() {
    _entries.clear();
  }

  @override
  List<MoodEntry> getLastN(int n) {
    if (n <= 0) return const [];
    final end = n < _entries.length ? n : _entries.length;
    return List.unmodifiable(_entries.sublist(0, end));
  }
}


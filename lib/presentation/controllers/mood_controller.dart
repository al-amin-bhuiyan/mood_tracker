import 'package:get/get.dart';
import 'package:mood_tracker/core/constants/app_constants.dart';
import 'package:mood_tracker/core/constants/mood_type.dart';
import 'package:mood_tracker/data/models/mood_entry.dart';
import 'package:mood_tracker/domain/abstractions/i_mood_repository.dart';

class MoodController extends GetxController {
  MoodController(this._repository);

  final IMoodRepository _repository;

  final RxList<MoodEntry> entries = <MoodEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    entries.assignAll(_repository.getLastN(AppConstants.maxTimelineEntries));
  }

  void logMood(MoodType type) {
    final entry = MoodEntry.create(type);
    _repository.addEntry(entry);
    entries.assignAll(_repository.getLastN(AppConstants.maxTimelineEntries));
  }

  void clearMoods() {
    _repository.clearAll();
    entries.clear();
  }

  bool get hasEntries => entries.isNotEmpty;
}


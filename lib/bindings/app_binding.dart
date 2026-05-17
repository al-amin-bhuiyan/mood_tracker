import 'package:get/get.dart';
import 'package:mood_tracker/data/repositories/local_mood_repository.dart';
import 'package:mood_tracker/domain/abstractions/i_mood_repository.dart';
import 'package:mood_tracker/presentation/controllers/mood_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMoodRepository>(() => LocalMoodRepository());
    Get.lazyPut(() => MoodController(Get.find<IMoodRepository>()));
  }
}


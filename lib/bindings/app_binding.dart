import 'package:get/get.dart';
import 'package:mood_tracker/data/repositories/local_mood_repository.dart';
import 'package:mood_tracker/domain/abstractions/i_mood_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMoodRepository>(() => LocalMoodRepository());
  }
}


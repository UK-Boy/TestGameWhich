import '../file_manipulator.dart';

class GameProgress {
  static Map<String, int> progress = {};

  static Map get() {
    progress.addAll({'ccc': 0});
    return progress;
  }

  static void start() => progress = FileMan.ReM("save/save.txt");
}

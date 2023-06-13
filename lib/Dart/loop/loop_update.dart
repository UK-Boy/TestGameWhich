import 'dart:io';

import 'package:clicker/Dart/save/game_progress.dart';
import 'package:clicker/Dart/save/game_save.dart';

class GameLoop {
  static final Stopwatch _loop = Stopwatch();
  static final Stopwatch _auto_save = Stopwatch();
  static const int _timeUpdate = 100;
  static bool _running = true;

  static void _loopUpdate() async {
    print("start");
    _loop.start();
    _auto_save.start();

    int temp = 0;

    while (_running) {
      if (_auto_save.elapsedMilliseconds >= 1000) {
        GameProgress.progress['monay'] = ++temp;
        _save();
      }

      if (_loop.elapsedMilliseconds >= 1000 * _timeUpdate) stop();

      sleep(Duration(milliseconds: _timeUpdate));
    }
  }

  static void _save() {
    GameSave.get();
    GameSave.set({'a': 1});
    _auto_save.reset();
  }

  static void start() => _loopUpdate();

  static void stop() => _running = false;
}

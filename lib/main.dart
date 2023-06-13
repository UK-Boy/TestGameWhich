import 'dart:io';
import 'package:flutter/material.dart';
import 'Dart/DKGPT-programing/DKGPT.dart';


void main() {
  startFlutter(); // тут запускаю весь флатер - подальша ебатня не працює

  // AutoSave save = AutoSave();
  // AutoSave.startSave();

  // Stopwatch stopwatch = Stopwatch();
  // stopwatch.start();
  // bool running = true;
  // num stop = 100 * 1000;

  // while (running) {
  //   if (stopwatch.elapsedMilliseconds >= stop) {
  //     AutoSave.stopSave();
  //     stopwatch.stop();
  //     running = false;
  //   }
  // }
}

void startFlutter() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClickerGame(),
  ));
}

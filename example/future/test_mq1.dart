import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

int tick = 0;

Function funTick = () {
  tick++;
  print('$tick ${DateTime.now()}');
};

void mainLoop() {
  Future.delayed(Duration(seconds: 1), funTick).then((value) => mainLoop());
}

void mainTick() {
  mainLoop();
  //不会阻塞eventLoop
  doWorkNonBlock();
}

String doWork(String value) {
  var name = Isolate.current.debugName;

  print('$name doWork start');
  sleep(Duration(seconds: 5));
  print('$name doWork end');
  return 'complete:$value';
}

void doWorkNonBlock() {
  var str = 'New Task';
  Future future = compute(doWork, str);
  future.then((value) {
    var name = Isolate.current.debugName;
    print('$name: then $value');
  });
}

void main() async {
  mainTick();
}

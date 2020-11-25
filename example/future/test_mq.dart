import 'dart:io';
import 'dart:isolate';

int tick = 0;

Function funTick = () {
  tick++;
  print('$tick ${DateTime.now()}');
};

void mainTick() {
  mainLoop();
  //会阻塞eventLoop
  // mainSleepBlock();

  //不会阻塞eventLoop
  mainSleepNonBlock();
}

void mainLoop() {
  Future future = Future.delayed(Duration(seconds: 1), funTick);
  future.then((value) => mainLoop());
}

void sleepBlock(dynamic p) {
  sleep(Duration(seconds: 3));
  print('Isolate is ${Isolate.current.debugName}');
}

void mainSleepBlock() {
  Future.delayed(Duration(seconds: 3), () {
    sleepBlock('');
  }).then((value) {});
}

void mainSleepNonBlock() {
  // compute(sleepBlock, '');
  ReceivePort receivePort = ReceivePort();
  //创建Isolate 绑定一个方法和向外通讯的port，
  // 创建完之后会立马执行sleepBlock方法，
  // 而且是在新的Isolate中
  Future future = Isolate.spawn(sleepBlock, receivePort.sendPort);
  future.then((value) {});
}

void main() async {
  mainTick();
}

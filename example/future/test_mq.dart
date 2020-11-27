import 'dart:io';
import 'dart:isolate';

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
  //会阻塞eventLoop
  // mainSleepBlock();

  //不会阻塞eventLoop
  mainSleepNonBlock();
}

void sleepBlock() {
  sleep(Duration(seconds: 3));
  print('Isolate is ${Isolate.current.debugName}');
}

void mainSleepBlock() {
  Future.delayed(Duration(seconds: 3), () {
    sleepBlock();
  }).then((value) {
    print('mainSleepBlock() then() ');
  });
}

void sleepBlockInIsolate(SendPort port) {
  var name = Isolate.current.debugName;

  ReceivePort receivePort = new ReceivePort();
  SendPort sendPort = receivePort.sendPort;

  receivePort.listen((message) {
    print('$name:  listen $message');
  });
  port.send([0, sendPort]);
  sleep(Duration(seconds: 3));
  port.send([1, 'doWork 任务完成']);
  print('$name:  end');
}

void mainSleepNonBlock() {
  // compute(sleepBlock, '');
  ReceivePort receivePort = ReceivePort();
  Future future = Isolate.spawn(sleepBlockInIsolate, receivePort.sendPort);
  future.then((_) {
    var name = Isolate.current.debugName;
    SendPort sendPort;
    receivePort.listen((message) {
      print('$name: then  listen $message');
      if (message[0] == 0) {
        sendPort = message[1];
      } else {
        sendPort?.send([1, '这条信息是 main isolate 发送的']);
      }
    });
  });
}

void main() async {
  mainTick();
}

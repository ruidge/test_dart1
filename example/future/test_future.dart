import 'package:test_dart1/lib_extension.dart';

Future<String> future1 = Future.delayed(Duration(seconds: 1), () {
  var value = '111';
  print('$value ${value.timestamp}');
  return value;
});

Future<String> future2 = Future.delayed(Duration(seconds: 2), () {
  var value = '222';
  print('$value ${value.timestamp}');
  return value;
});

Future<String> future3 = Future.delayed(Duration(seconds: 3), () {
  var value = '333';
  print('$value ${value.timestamp}');
  return value;
});

void main() {
  print('-------------------${''.timestamp}');

  // fun1();
  // fun2();
  // fun3();
  fun4();
}

void fun1() {
  future1.then((value) {
    future2.then((value) {
      future3.then((value) => {});
    });
  });
}

void fun2() async {
  await future1;
  await future2;
  await future3;
}

void fun3() async {
  var result = await Future.any({future1, future2, future3});
  print('this is result : $result');
}

void fun4() {
  Future.wait({future1, future2, future3})
      .then((value) => print('this is result : $value'));
}

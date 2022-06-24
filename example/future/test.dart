import 'dart:io';

import 'package:test_dart1/lib_extension.dart';

void main() {
  fun1();
}

void fun1() {
  Future future = new Future(() {
    sleep(Duration(milliseconds: 1000));
    return "sleep 1000";
  });
  future.then((value) {
    print(value);
    sleep(Duration(milliseconds: 1000));
    return "then 1";
  }).then((value) => print(value));
}

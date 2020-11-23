import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_dart1/test_dart1.dart';

void main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');

  maxIntInPart(1, 2);
  maxIntInLibrary(1, 2);
  Text text = Text(
    "data",
    style: TextStyle(color: Colors.white),
  );
}

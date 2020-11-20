void main() {
  methodA();
  methodB();
  methodC('main');
  methodD();
}

methodA() {
  print('A');
}

methodB() {
  print('B start');
  methodC('B');
  print('B end');
}

methodC(String from) {
  print('C start from $from');

  Future(() {
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD() {
  print('D');
}

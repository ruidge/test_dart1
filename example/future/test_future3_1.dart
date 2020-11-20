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

methodC(String from) async {
  print('C start from $from');

  await Future(() {
    // <== 该代码将在未来的某个时间段执行
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD() {
  print('D');
}

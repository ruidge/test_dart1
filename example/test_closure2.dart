Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

typedef NumFuncNum = num Function(num n);

void main() {
  NumFuncNum add2 = makeAdder(2);
  NumFuncNum add4 = makeAdder(4);

  //不匹配运行时错误
  print(add2(10));
  print(add4(10));
}

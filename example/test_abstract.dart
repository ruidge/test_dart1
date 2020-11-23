abstract class AbsBase {
  // 省略函数体即可定义抽象方法，不需加关键字
  func1();

  _func2();

  func3();
}

//必须实现所有的方法
class AA implements AbsBase {
  @override
  func1() {
    print("AA func1()");
  }

  @override
  _func2() {
    print("AA _func2");
  }

  @override
  func3() {
    // TODO: implement func3
    return null;
  }

  funcAA() {
    print("AA.funcAA()");
  }
}

class BB extends AA {
  int _b1 = 1;
  int b2 = 2;

  @override
  _func2() {
    super._func2();
  }

  funcAA() {
    super.funcAA();
  }
}

//需要实现AA中的方法
class BB2 implements BB {
  // int _b1 = 1;
  // int b2 = 2;

  @override
  _func2() {
    // TODO: implement _func2
    return null;
  }

  @override
  func1() {
    // TODO: implement func1
    return null;
  }

  @override
  func3() {
    // TODO: implement func3
    return null;
  }

  @override
  funcAA() {
    // TODO: implement funcAA
    return null;
  }
}

//import 的同一个文件可访问下划线开头
main(List<String> args) {
  AbsBase abb = AA();
  AA aa = AA();
  aa._func2();

  BB bb = BB();
  print(bb._b1);
  print(bb.b2);
}

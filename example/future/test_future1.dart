void main() {
  // func1();
  // func2();
  func3();
}

func1() {
  Future<String> future = Future(() {
    return "future value";
  });

  future.then((value) {
    print("onValue: $value");
    return "then value";
  }, onError: (error) {
    print("onError $error");
  }).then((value) {
    print("onValue: $value");
  });
}

func2() {
  Future<String> future = Future(() {
    throw Exception("exception occured");
  });
  future.then((value) {
    print("onValue: $value");
  }).catchError((error) {
    print("catchError1 $error");
  }, test: (_) {
    return false;
  }).catchError((error) {
    print("catchError2 $error");
  });
}

func3() {
  Future<String> future = Future(() {
    return "future value";
  });
  future.then((value) {
    print("onValue: $value");
    throw Exception("onValue Exception");
  }, onError: (error) {
    print("onError $error");
  }).catchError((error) {
    print("catchError $error");
  });
}

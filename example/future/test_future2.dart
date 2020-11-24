void main() {
  print('111');
  var gd = getData();
  print(gd.runtimeType);
  print('222');
}

getData() async {
  /*await*/ Future<String>.delayed(Duration(seconds: 1), () {
    String result = '333';
    print(result);
    return result;
  });

  print('444');
}

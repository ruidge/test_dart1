void main() {
  var func11 = func1();

  // print(func11.runtimeType.toString());
  print(func11['get']);
  print(func11['get']());

  print(func11['set']);
  func11['set']('ruidge');

  print(func11['get']());
}

Map<String, Function> func1() {
  var name = 'default';

  String getName() {
    return name;
  }

  void setName(String nameNew) {
    name = nameNew;
  }

  return {'get': getName, 'set': setName};
}

class Person {}

mixin DrawFunc on Person {
  String content = '..';

  String what();

  void draw() {
    print('I can draw ${what()}');
  }
}

class Teacher extends Person with DrawFunc {
  String what() => "car";
}

class Teacher2 with Person, DrawFunc {
  String what() => "car2";
}

void main() {
  Teacher().draw();
  Teacher2().draw();

  //Mixins can't be instantiated.
  // DrawFunc drawFunc = DrawFunc();
}

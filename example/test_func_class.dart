import 'dart:core';

void main() {
  var stu5 = Stu5("stu5", 2);
  stu5.gradeUpward();
  stu5.printInfo();
  Map<String, Function> stu6 = Stu6("stu6", 6);
  stu6["gradeUpward"]();
  stu6["printInfo"]();
}

class Stu5 {
  String name;
  num grade;

  Stu5(this.name, this.grade);

  void gradeUpward() {
    grade++;
  }

  void printInfo() {
    print('name is :$name, grade is $grade');
  }
}

Map<String, Function> Stu6(String name, num grade) {
  String _name = name;
  num _grade = grade;

  void gradeUpward() {
    grade++;
  }

  void printInfo() {
    print('name is :$name, grade is $grade');
  }

  return {
    "name": () {
      return _name;
    },
    "grade": () {
      return _grade;
    },
    "gradeUpward": gradeUpward,
    "printInfo": printInfo
  };
}

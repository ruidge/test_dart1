class Point {
  num x;
  num y;

  // 方法名前加set关键字
  set xx(num xx) {
    // do something
    this.x = xx;
  }

  //1
  Point(this.x, this.y);

  //2
  Point.fromA(this.x, this.y) {}

  //3
  Point._fromB(x, y) : this(x, y);

  //4 factory修饰有返回值
  factory Point.fromC(x, y) {
    return Point.fromA(x, y);
  }

  // 没返回值
  Point.fromE(x, y) {
    this.x = x;
    Point.fromA(x, y);
  }

  //5 和1不能同时存在...
  // factory Point(x) {
  //   return Point.fromA(x, x);
  // }

  Point.fromD(x) : this(x, x);
}

void main() {
  Point p1 = Point(1, 1);
  // Point p1 = Point(1);
  Point p2 = Point.fromA(2, 2);
  Point p3 = Point._fromB(3, 3);
  Point p4 = Point.fromC(4, 4);
  Point p5 = Point.fromD(5);
}

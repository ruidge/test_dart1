abstract class Comparable1<T> {
  int compareTo(T other);
}

class CC1 implements Comparable1<CC1> {
  int value;

  CC1(this.value);

  @override
  int compareTo(CC1 other) {
    return value - other.value;
  }
}

mixin Comparable2 {
  int compareTo(int a, int b) {
    return a - b;
  }
}

class CC2 {
  int value;

  CC2(this.value);
}

class Opera with Comparable2 {
  int opt1(CC1 a, CC1 b) {
    return a.compareTo(b);
  }

  int opt2(CC2 a, CC2 b) {
    return compareTo(a.value, b.value);
  }
}

void main() {
  var opera = Opera();
  print(opera.opt1(CC1(1), CC1(2)));
  print(opera.opt2(CC2(1), CC2(2)));
}

class S {
  a() {
    print("S.a");
  }
}

class A {
  a() {
    print("A.a");
  }

  b() {
    print("A.b");
  }
}

class B {
  a() {
    print("B.a");
  }

  b() {
    print("B.b");
  }

  c() {
    print("B.c ");
  }
}

class Tbas = B with A, S;

class Tsab = S with A, B;

class Tsba = S with B, A;

main(List<String> args) {
  Tbas t = new Tbas();
  t.a();
  t.b();
  t.c();

  Tsab tsab = Tsab();
  tsab.a();
  tsab.b();
  tsab.c();

  Tsba tsba = Tsba();
  tsba.a();
  tsba.b();
  tsba.c();
}

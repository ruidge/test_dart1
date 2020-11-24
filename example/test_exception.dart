main() {
  func();
}

void func() {
  try {
    throw FormatException('main FormatException');
  } on FormatException {
    print('on FormatException');
  } catch (e, s) {
    if (e is FormatException) {
      print('catch FormatException');
    }
    print('catch (e, s)');
  } finally {
    print('finally');
  }
}

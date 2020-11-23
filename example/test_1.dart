main() {
  // Unhandled exception:
  // NoSuchMethodError: Closure call with mismatched arguments: function 'greet'
  // Receiver: Closure: (String) => String from Function 'greet': static.
  // Tried calling: greet()
  // Found: greet(String) => String
  printFunc(greet);
}

void printFunc(Function f) {
  print(f());
}

String greet(String name) {
  return "hello,$name";
}

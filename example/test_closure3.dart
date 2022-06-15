// Function genCircleArea(double radius) {
//   const PI = 3.14;
//
//   return () {
//     return PI * radius * radius;
//   };
// }
//
// void main() {
//   print(genCircleArea(2)());
//   print(genCircleArea(1)());
// }

void main() {
  performClick("button", () {
    print("click");
  });
}

void performClick(String name, Function func) {
  print("$name click ->");
  func();
}

import 'package:test_dart1/lib_extension.dart';

main(List<String> arguments) {
  var result1 = "12345".substring(1).substring(1);
  result1.printSelf();

  1.printSelf();

  int i = null;
  i.printSelf();
}

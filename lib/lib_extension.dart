import 'package:date_format/date_format.dart';

extension StringExtension on String {
  ///打印自己
  printSelf() {
    print('$this');
  }
}

extension NumExtension on num {
  ///打印自己
  printSelf() {
    print('$this');
  }
}

extension ListExtension on List {
  ///打印自己
  printSelf() {
    print('$this');
  }
}

extension ObjectExtension on Object {
  ///打印自己
  String get timestamp {
    return formatDate(DateTime.now(), [HH, ':', nn, ':', ss, ':', SSS]);
  }
}

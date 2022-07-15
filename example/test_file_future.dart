import 'dart:io';

import 'package:path/path.dart';

main() {
  var dir = dirname(Platform.script.path);
  print(dir);
  // opFile1(dir);
  // opFile2(dir);
  opFile3(dir);
}

void opFile1(String dir) {
  var path = '$dir/dir/test.txt';
  var file = File(path);
  file.exists().then((value) {
    if (value) {
      file.delete(recursive: true).then((value) {
        op2(file);
      });
    } else {
      op2(file);
    }
  });
}

void op2(File file) {
  file.create(recursive: true).then((value) {
    file.open(mode: FileMode.write).then((value) {
      DateTime dateTime = new DateTime.now();
      value
          .writeString(
              "current time is :${dateTime.hour}:${dateTime.minute}:${dateTime.second}")
          .then((value) {
        value.close();
      });
    });
  });
}

void opFile2(String dir) {
  var path = '$dir/dir/test.txt';
  var file = File(path);
  file.exists().then((value) {
    if (value) {
      file.delete(recursive: true).then((value) {
        return file;
      });
    }
    return file;
  }).then((value) {
    return value.create(recursive: true);
  }).then((value) {
    return value.open(mode: FileMode.write);
  }).then((value) {
    DateTime dateTime = new DateTime.now();
    value.writeString(
        "current time is :${dateTime.hour}:${dateTime.minute}:${dateTime.second}");
    return value;
  }).then((value) {
    value.close();
    return true;
  });
}

void opFile3(String dir) async {
  var path = '$dir/dir/test.txt';
  var file = File(path);
  var exists = await file.exists();
  if (exists) {
    await file.delete(recursive: true);
  }
  await file.create(recursive: true);
  var accessFile = await file.open(mode: FileMode.write);
  DateTime dateTime = new DateTime.now();
  await accessFile.writeString(
      "current time is :${dateTime.hour}:${dateTime.minute}:${dateTime.second}");
  await accessFile.close();
}

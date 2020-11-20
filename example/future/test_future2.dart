void main() {
  print('111');
  getData();
  print('222');
}

void getData() async {
  String result = await Future<String>.delayed(Duration(milliseconds: 0), () {
    return "333";
  });

  print(result);
  print('444');
}

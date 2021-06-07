import 'dart:math';

List<int> fixedListRamdom({int len = 1, int max = 120, int min = 1}) {
  if (len > max || len < min) {
    return [];
  }
  List<int> newList = [];

  Random random = Random();
  int count = 1;
  while (count <= len) {
    int val = random.nextInt(max);
    if (newList.contains(val)) {
      continue;
    } else {
      newList.add(val);
      count++;
    }
  }
  return newList;
}

import 'model/Item.dart';
import 'dart:math' as math;
import 'dart:async';

var items = [
  new Item(0, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(1, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(2, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(3, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(4, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(5, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(6, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(7, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(8, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(9, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(10, 0, (math.Random().nextDouble() * 0xFFFFFF).toInt()),
];

Future<List<Item>> fetchItems() async {
  await Future.delayed(const Duration(seconds: 3), () {});
  return items;
}

import 'package:flutter/foundation.dart';

class Item {
  final int id;
  int score;
  final int color;

  Item({@required this.id, @required this.score, @required this.color});
}

class AppState {
  final List<Item> items;

  AppState({@required this.items});

  AppState.initialState() : items = List.unmodifiable(<Item>[]);
}

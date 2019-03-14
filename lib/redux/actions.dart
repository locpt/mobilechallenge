import 'package:mobilechallenge/model/model.dart';

class AddItemAction {
  static int _id = 0;
  final int score;
  final int color;

  AddItemAction(this.score, this.color) {
    _id++;
  }

  int get id => _id;
}

class UpdateItemAction {
  final Item item;

  UpdateItemAction(this.item);
}

class GetItemsAction {}

class LoadedItemsAction {
  final List<Item> items;

  LoadedItemsAction(this.items);
}

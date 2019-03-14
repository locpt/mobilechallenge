import 'package:mobilechallenge/model/model.dart';
import 'dart:math' as math;
import 'dart:async';
import 'package:redux/redux.dart';
import 'actions.dart';

var items = [
  new Item(id: 0,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 1,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 2,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 3,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 4,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 5,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 6,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 7,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 8,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
  new Item(id: 9,score: 0,color: (math.Random().nextDouble() * 0xFFFFFF).toInt()),
];

Future<AppState> fetchItems() async {
  return AppState(items: items);
}

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  if (action is GetItemsAction) {
    await fetchItems()
        .then((state) => store.dispatch(LoadedItemsAction(state.items)));
  }
}
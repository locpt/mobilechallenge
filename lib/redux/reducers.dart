import 'actions.dart';
import 'package:mobilechallenge/model/model.dart';

AppState appStateReducers(AppState state, action) {
  return AppState(items: itemReducer(state.items, action));
}

List<Item> itemReducer(List<Item> list, action) {
  if (action is AddItemAction) {
    return []
      ..addAll(list)
      ..add(Item(id: action.id, score: action.score, color: action.color));
  }

  if (action is UpdateItemAction) {
    Item item =
        list.firstWhere((index) => index.id == action.item.id, orElse: null);
    if (item != null) {
      item = action.item;
    }
  }

  if (action is LoadedItemsAction) {
    return action.items;
  }

  return list;
}

import 'model/model.dart';
import 'package:redux/redux.dart';
import 'package:mobilechallenge/redux/actions.dart';

class MainViewModel {
  final List<Item> items;
  final Function(Item) onUpdateItem;

  MainViewModel({this.items, this.onUpdateItem});

  factory MainViewModel.create(Store<AppState> store) {
    _onUpdateItem(Item item) {
      store.dispatch(UpdateItemAction(item));
    }

    return MainViewModel(items: store.state.items, onUpdateItem: _onUpdateItem);
  }
}

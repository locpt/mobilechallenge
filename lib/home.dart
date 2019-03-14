import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobilechallenge/blockview.dart';
import 'package:mobilechallenge/horizontallistview.dart';
import 'package:mobilechallenge/mainviewmodel.dart';
import 'package:mobilechallenge/model/model.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  final Store<AppState> store;
  final HorizontalListView horizontalListView = HorizontalListView();
  final BlockView blockView = BlockView();

  HomePage(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainViewModel>(
        converter: (Store<AppState> store) => MainViewModel.create(store),
        builder: (BuildContext context, MainViewModel viewModel) {
          if (viewModel.items.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            horizontalListView.setModel(viewModel);
            blockView.setModel(viewModel);
            horizontalListView.setOnItemClickListener((item) {
              updateBlockView(blockView, item);
            });
            return Column(
              children: <Widget>[horizontalListView, blockView],
            );
          }
        });
  }

  void updateBlockView(BlockView blockView, Item item) {
    if (blockView != null && item != null) {
      blockView.invalidate(item);
    }
  }
}

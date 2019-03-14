import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobilechallenge/blockview.dart';
import 'package:mobilechallenge/horizontallistview.dart';
import 'package:mobilechallenge/mainviewmodel.dart';
import 'package:mobilechallenge/model/model.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  final Store<AppState> store;

  HomePage(this.store);

  @override
  Widget build(BuildContext context) {
    HorizontalListView horizontalListView;
    BlockView blockView;

    return StoreConnector<AppState, MainViewModel>(
        converter: (Store<AppState> store) => MainViewModel.create(store),
        builder: (BuildContext context, MainViewModel viewModel) {
          if (viewModel.items.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            blockView = BlockView(viewModel);
            horizontalListView = HorizontalListView(viewModel);
            horizontalListView.setOnItemClickListener((item) {
              if (blockView != null && item != null) {
                blockView.invalidate(item);
              }
            });
            return Column(
              children: <Widget>[horizontalListView, blockView],
            );
          }
        });
  }
}

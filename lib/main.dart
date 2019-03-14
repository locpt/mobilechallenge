import 'package:flutter/material.dart';
import 'package:mobilechallenge/model/Item.dart';
import 'HorizontalListView.dart';
import 'BlockView.dart';
import 'data.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal ListView';
    final BlockView blockView = BlockView();
    final HorizontalListView horizontalListView = HorizontalListView();

    blockView.setOnUpdateItemListener((item) {
      _updateHorizontalListView(horizontalListView, item);
    });

    horizontalListView.setOnItemClickListener((item) {
      _updateBlockView(blockView, item);
    });

    return new MaterialApp(
        title: title,
        home: new Scaffold(
            appBar: new AppBar(
              title: Text(title),
            ),
            body: FutureBuilder(
                future: fetchItems(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  if (snapshot.hasData) {
                    horizontalListView.setItems(snapshot.data);
                    return Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 200.0,
                            child: horizontalListView),
                        Container(
                          alignment: Alignment.center,
                          child: blockView,
                        ),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }

  void _updateBlockView(BlockView blockView, Item item) {
    if (blockView != null) {
      blockView.invalidate(item);
    }
  }

  void _updateHorizontalListView(
      HorizontalListView horizontalListView, Item item) {
    if (horizontalListView != null) {
      horizontalListView.updateItem(item);
    }
  }
}

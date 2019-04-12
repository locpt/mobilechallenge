import 'package:flutter/material.dart' as listview_widget;
import 'package:mobilechallenge/model/Item.dart';

typedef OnItemClickListener = void Function(Item item);

// ignore: must_be_immutable
class HorizontalListView extends listview_widget.StatefulWidget {
  List<Item> items;
  OnItemClickListener callback;
  HorizontalListViewState horizontalListViewState = HorizontalListViewState();

  @override
  listview_widget.State<listview_widget.StatefulWidget> createState() {
    return horizontalListViewState;
  }

  void setItems(List<Item> items) {
    this.items = items;
  }

  void setOnItemClickListener(OnItemClickListener callback) {
    this.callback = callback;
  }

  void updateItem(Item item) {
    horizontalListViewState.updateItem(item);
  }
}

class HorizontalListViewState extends listview_widget.State<HorizontalListView> {
  void updateListItem() {
    setState(() {});
  }

  void updateItem(Item item) {
    final Item temp =
        widget.items.firstWhere((data) => data.id == item.id, orElse: null);
    if (temp != null) {
      setState(() {
        temp.score = item.score;
      });
    }
  }

  List<listview_widget.GestureDetector> _buildListFromItems() {
    return widget.items.map((item) {
      final gestureDetector = listview_widget.GestureDetector(
        child: buildColumn(item),
        onTap: () {
          if (widget.callback != null) {
            widget.callback(item);
          }
        },
      );
      return gestureDetector;
    }).toList();
  }

  @override
  listview_widget.Widget build(listview_widget.BuildContext context) {
    return listview_widget.ListView(
      shrinkWrap: true,
      scrollDirection: listview_widget.Axis.horizontal,
      children: _buildListFromItems(),
    );
  }
}

listview_widget.SizedBox buildColumn(Item item) {
  return listview_widget.SizedBox(
    width: 200.0,
    child: listview_widget.Container(
        alignment: listview_widget.Alignment.center,
        color: listview_widget.Color(item.color << 0).withOpacity(0.8),
        child: listview_widget.Text(
          item.score.toString(),
          style: listview_widget.TextStyle(fontWeight: listview_widget.FontWeight.bold, fontSize: 32.0),
        )),
  );
}

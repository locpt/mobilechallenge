import 'package:flutter/material.dart';
import 'package:mobilechallenge/model/Item.dart';

typedef OnItemClickListener = void Function(Item item);

// ignore: must_be_immutable
class HorizontalListView extends StatefulWidget {
  List<Item> items;
  OnItemClickListener callback;
  HorizontalListViewState horizontalListViewState = HorizontalListViewState();

  @override
  State<StatefulWidget> createState() {
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

class HorizontalListViewState extends State<HorizontalListView> {
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

  List<GestureDetector> _buildListFromItems() {
    return widget.items.map((item) {
      final gestureDetector = GestureDetector(
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
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: _buildListFromItems(),
    );
  }
}

SizedBox buildColumn(Item item) {
  return SizedBox(
    width: 200.0,
    child: Container(
        alignment: Alignment.center,
        color: Color(item.color << 0).withOpacity(0.8),
        child: Text(
          item.score.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        )),
  );
}

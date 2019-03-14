import 'package:flutter/material.dart';
import 'package:mobilechallenge/model/model.dart';
import 'mainviewmodel.dart';

typedef OnItemClickListener = void Function(Item item);

// ignore: must_be_immutable
class HorizontalListView extends StatefulWidget {
  final MainViewModel model;
  OnItemClickListener callback;

  HorizontalListView(this.model);

  @override
  State<StatefulWidget> createState() {
    return HorizontalListViewState();
  }

  void setOnItemClickListener(OnItemClickListener callback) {
    this.callback = callback;
  }
}

class HorizontalListViewState extends State<HorizontalListView> {
  List<GestureDetector> _buildListFromItems() {
    return widget.model.items.map((item) {
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: _buildListFromItems(),
      ),
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

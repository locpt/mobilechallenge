import 'package:flutter/material.dart';
import 'package:mobilechallenge/model/model.dart';
import 'mainviewmodel.dart';

typedef OnItemClickListener = void Function(Item item);

// ignore: must_be_immutable
class HorizontalListView extends StatelessWidget {
  MainViewModel model;
  OnItemClickListener callback;

  void setModel(MainViewModel model) {
    this.model = model;
  }

  void setOnItemClickListener(OnItemClickListener callback) {
    this.callback = callback;
  }

  List<GestureDetector> _buildListFromItems() {
    return this.model.items.map((item) {
      final gestureDetector = GestureDetector(
        child: buildColumn(item),
        onTap: () {
          if (this.callback != null) {
            this.callback(item);
          }
        },
      );
      return gestureDetector;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

import 'package:flutter/material.dart';
import 'package:mobilechallenge/model/Item.dart';

typedef OnUpdateItemListener = void Function(Item item);

// ignore: must_be_immutable
class BlockView extends StatefulWidget {
  final BlockViewState blockViewState = BlockViewState();
  OnUpdateItemListener callback;

  @override
  State<StatefulWidget> createState() {
    return blockViewState;
  }

  void setOnUpdateItemListener(OnUpdateItemListener callback) {
    this.callback = callback;
  }

  void invalidate(Item item) {
    blockViewState.invalidateBlockView(item);
  }
}

class BlockViewState extends State<BlockView> {
  Item item;

  void invalidateBlockView(Item item) {
    setState(() {
      this.item = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.item.score++;
        });
        if (widget.callback != null) {
          widget.callback(item);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 200.0,
        height: 200.0,
        color: this.item == null
            ? Color.fromARGB(0, 0, 0, 0)
            : Color(this.item.color << 0).withOpacity(0.8),
        child: Text(
          this.item == null ? "" : this.item.score.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        ),
      ),
    );
  }
}

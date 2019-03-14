import 'package:flutter/material.dart';
import 'package:mobilechallenge/model/model.dart';
import 'mainviewmodel.dart';

// ignore: must_be_immutable
class BlockView extends StatefulWidget {
  final MainViewModel model;
  final BlockViewState blockViewState = BlockViewState();

  BlockView(this.model);

  @override
  State<StatefulWidget> createState() {
    return blockViewState;
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
        widget.model.onUpdateItem(this.item);
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

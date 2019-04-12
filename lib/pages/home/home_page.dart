import 'package:flutter/material.dart';
import 'package:mobilechallenge/widgets/card_widget.dart';
import 'package:mobilechallenge/widgets/list_view_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[CardListView(), CardWidget()],
    );
  }
}

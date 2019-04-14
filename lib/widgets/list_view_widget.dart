import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/widgets/cart_item_widget.dart';

class CardListView extends StatelessWidget {
  final List<CardItem> cards;

  const CardListView({Key key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cards == null ? 0 : cards.length,
        itemBuilder: (context, index) {
          return CardItemWidget(card: cards[index]);
        },
      ),
    );
  }
}

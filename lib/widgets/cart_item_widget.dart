import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';

class CardItemWidget extends StatelessWidget {
  final CardItem cardItem;

  const CardItemWidget({Key key, @required this.cardItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc _homeBloc = BlocProvider.of<HomeBloc>(context);
    return GestureDetector(
      onTap: () => _homeBloc.onItemClick(cardItem),
      child: SizedBox(
        width: 200.0,
        child: Container(
            alignment: Alignment.center,
            color: cardItem.color,
            child: Text(
              cardItem.score.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: Colors.white),
            )),
      ),
    );
  }
}

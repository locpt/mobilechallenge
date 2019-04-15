import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/blocs/card_bloc.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';
import 'package:mobilechallenge/model/card.dart';

class CardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CardWidgetState();
}

class CardWidgetState extends State<CardWidget> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _initBloc();
  }

//  @override
//  void dispose() {
//    super.dispose();
//    _disposeBloc();
//  }
//
//  @override
//  void didUpdateWidget(CardWidget oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    _disposeBloc();
//    _initBloc();
//  }

  void _initBloc() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  void _disposeBloc() {
    _homeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CardItem>(
      stream: _homeBloc.getCardFromEvent,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () => _homeBloc.onIncreaseCardValue(snapshot.data),
          child: Container(
            alignment: Alignment.center,
            width: 200.0,
            height: 200.0,
            color: snapshot.data == null
                ? Color.fromARGB(0, 0, 0, 0)
                : snapshot.data.color,
            child: Text(
              snapshot.data == null ? "" : snapshot.data.score.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

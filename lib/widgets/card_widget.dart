import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';
import 'package:mobilechallenge/model/card.dart';

class CardWidget extends StatefulWidget {
  final CardItem cardItem;

  const CardWidget({Key key, this.cardItem}) : super(key: key);

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

  @override
  void didUpdateWidget(CardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _disposeBloc();
    _initBloc();
  }

  void _initBloc() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.cardItem(this.widget.cardItem);
  }

  void _disposeBloc() {
    _homeBloc.dispose();
  }

  void setCardItem(CardItem card) {
    setState(() {
      this.widget.cardItem.copyWith(card.id, card.score, card.color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _homeBloc.cardStream,
        builder: (BuildContext context, AsyncSnapshot<CardItem> snapshot) {
          final CardItem card = snapshot.data;
          return GestureDetector(
            onTap: () {
              int currentScore = card.score;
              _homeBloc.onCardClick(
                  card.copyWith(card.id, currentScore++, card.color));
            },
            child: Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 200.0,
              color: card == null ? Color.fromARGB(0, 0, 0, 0) : card.color,
              child: Text(
                card == null ? "" : card.score.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _disposeBloc();
  }
}

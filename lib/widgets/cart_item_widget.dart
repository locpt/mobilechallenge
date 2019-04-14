import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';

class CardItemWidget extends StatefulWidget {
  final CardItem cardItem;
  final VoidCallback onPressed;
  const CardItemWidget({Key key, this.cardItem, this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CardItemWidget();
}

class _CardItemWidget extends State<CardItemWidget> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _initBloc();
  }

  _initBloc() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.cardItem(this.widget.cardItem);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CardItem>(
      stream: _homeBloc.cardStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final CardItem cardItem = snapshot.data;
        return GestureDetector(
          onTap: () => widget.onPressed,
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
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';

class CardItemWidget extends StatefulWidget {
  final CardItem card;

  const CardItemWidget({Key key, this.card}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CardItemWidget();
}

class _CardItemWidget extends State<CardItemWidget> {
  HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    _initBloc();
  }

  _initBloc() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: homeBloc.cardItemStream,
        builder: (BuildContext context, AsyncSnapshot<CardItem> snapshot) {
          return GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 200.0,
              child: Container(
                  alignment: Alignment.center,
                  color: widget.card.color,
                  child: Text(
                    widget.card.score.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
                  )),
            ),
          );
        });
  }
}

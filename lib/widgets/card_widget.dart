import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';
import 'package:mobilechallenge/model/card.dart';

class CardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: homeBloc.cardItemStream,
        builder: (BuildContext context, AsyncSnapshot<CardItem> snapshot) {
          return GestureDetector(
            onTap: () {
              homeBloc.handleCardClick(snapshot.data);
            },
            child: Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 200.0,
              color: snapshot.data == null
                  ? Color.fromARGB(0, 0, 0, 0)
                  : snapshot.data.color,
              child: Text(
                snapshot.data == null ? "" : snapshot.data.score.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
            ),
          );
        });
  }
}

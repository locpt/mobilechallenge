import 'package:flutter/material.dart';
import 'package:mobilechallenge/keys/AppKey.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';
import 'package:mobilechallenge/widgets/card_container_widget.dart';
import 'package:mobilechallenge/widgets/list_view_widget.dart';

class HomePage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CardItem>>(
      stream: _homeBloc.cardsStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: <Widget>[
              CardListView(
                cards: snapshot.data,
              ),
              CardContainer(key: AppKey.cardContainerGlobalKey,)
            ],
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/widgets/cart_item_widget.dart';

class CardListView extends StatefulWidget {
  final List<CardItem> cards;

  const CardListView({Key key, this.cards}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CardListViewState();
}

class CardListViewState extends State<CardListView> {
  HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CardItem>>(
        stream: homeBloc.listStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<CardItem>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return CardItemWidget(card: widget.cards[index]);
              },
            );
          }
        });
  }
}

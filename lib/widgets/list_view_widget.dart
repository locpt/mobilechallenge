import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/widgets/card_widget.dart';
import 'package:mobilechallenge/widgets/cart_item_widget.dart';

class CardListView extends StatefulWidget {
  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CardItem>>(
        stream: _homeBloc.getCards,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  return CardItemWidget(cardItem: snapshot.data[index]);
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

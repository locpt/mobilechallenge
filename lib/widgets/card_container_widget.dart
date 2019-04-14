import 'package:flutter/cupertino.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/widgets/card_widget.dart';

class CardContainer extends StatefulWidget {
  CardContainer({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CardContainerState();
}

class CardContainerState extends State<CardContainer> {
  CardItem _cardItem;

  set cardItem(CardItem card) {
    setState(() {
      this._cardItem = card;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_cardItem == null)
        ? Center(
            child: Text('Click on a card to see the details...'),
          )
        : CardWidget(
            cardItem: _cardItem,
          );
  }
}

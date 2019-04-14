import 'dart:async';
import 'package:mobilechallenge/blocs/base/bloc_base.dart';
import 'package:mobilechallenge/data/repository/card_repo.dart';
import 'package:mobilechallenge/data/repository/card_repo_impl.dart';
import 'package:mobilechallenge/model/card.dart';

class HomeBloc extends BlocBase {
  // List of all items
  List<CardItem> _cards;

  CardRepository _cardRepository = CardRepoImpl();

  /*
  Stream to list of all possible items
  * */
  StreamController<List<CardItem>> _cardsController = StreamController();

  Stream<List<CardItem>> get cardsStream => _cardsController.stream;

  /* 
  Stream to control single [CardItem] and [CardWidget]
  * */
  StreamController<CardItem> _cardController = StreamController();

  Stream<CardItem> get cardStream => _cardController.stream;

  HomeBloc() {
    _getCards();
  }

  void cardItem(CardItem card) {
    _cardsController.stream
        .map((cards) => cards.any((CardItem item) => item.id == card.id))
        .listen((bool) => _cardController.sink.add(card));
  }

  @override
  void dispose() {
    _cardsController.close();
  }

  void _getCards() {
    _cardRepository.getCards().then((cards) {
      this._cards = cards;
      _cardsController.sink.add(_cards);
    });
  }

  void onCardClick(CardItem card) {
    //Modify [card] int [_cards]
    for (int i = 0; i < this._cards.length; i++) {
      if (this._cards[i].id == card.id) {
        this._cards[i] = card;
      }
    }
    //Notify [_cardsController] and [_cardsController] will notify [_cardController] to make the ListView doesn't rebuild whole [_cards]
    _cardsController.sink.add(this._cards);
  }
}

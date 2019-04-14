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
  *   Stream to list of all possible items
  * */
  StreamController<List<CardItem>> _cardsController = StreamController();
  Stream<List<CardItem>> get cardsStream => _cardsController.stream;

  HomeBloc() {
    _getCards();
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

  void handleCardClick(CardItem data) {}
}

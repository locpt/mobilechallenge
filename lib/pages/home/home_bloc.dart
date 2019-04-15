import 'dart:async';
import 'package:mobilechallenge/blocs/base/bloc_base.dart';
import 'package:mobilechallenge/data/repository/card_repo.dart';
import 'package:mobilechallenge/data/repository/card_repo_impl.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  // List of all items
  List<CardItem> _cards;
  CardRepository _cardRepository = CardRepoImpl();

  /*
  Stream to list of all possible items
  * */
  PublishSubject<List<CardItem>> _cardsSubject = PublishSubject();
  Stream<List<CardItem>> get getCards => _cardsSubject.stream;

  /*
  Stream to control single [CardItem] and [CardWidget]
  * */
  BehaviorSubject<CardItem> _increaseCardSubject = BehaviorSubject();
  Stream<CardItem> get getCard => _increaseCardSubject.stream;

  /*
  Stream to control event click on [CardWidget]
  * */
  BehaviorSubject<CardItem> _clickEventSubject = BehaviorSubject();
  Stream<CardItem> get getCardFromEvent => _clickEventSubject.stream;

  HomeBloc() {
    _getCards();
  }

  @override
  void dispose() {
    _clickEventSubject.close();
    _increaseCardSubject.close();
    _cardsSubject.close();
  }

  void _getCards() {
    _cardRepository.getCards().then((cards) {
      this._cards = cards;
      _cardsSubject.sink.add(_cards);
    });
  }

  void onIncreaseCardValue(CardItem card) {
    //Update value for item in list card
    for (int index = 0; index < _cards.length; index++) {
      if (_cards[index].id == card.id) {
        int score = card.score;
        score++;
        _cards[index] = CardItem(id: card.id, score: score, color: card.color);

        //Notify [_cardsSubject]
        this._cardsSubject.sink.add(_cards);
        this._clickEventSubject.sink.add(_cards[index]);
        break;
      }
    }
  }

  void onItemClick(CardItem card) {
    this._clickEventSubject.sink.add(card);
  }
}

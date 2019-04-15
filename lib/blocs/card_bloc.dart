import 'dart:async';
import 'package:mobilechallenge/blocs/base/bloc_base.dart';
import 'package:mobilechallenge/model/card.dart';

class CardBloc implements BlocBase {
  StreamController<List<CardItem>> _cardsController = StreamController();
  StreamSink<List<CardItem>> get setCards => _cardsController.sink;

  StreamController<CardItem> _itemController = StreamController();
  Stream<CardItem> get getItem => _itemController.stream;

  StreamSubscription _subscription;

  CardBloc(CardItem card) {
//    _subscription = _cardsController.stream
//        .map((list) => list.firstWhere((item) => item.id == card.id))
//        .listen((item) {
//      if (item != null) {
//        this._itemController.sink.add(item);}
//    });
    this._itemController.sink.add(card);
  }

  @override
  void dispose() {
    _subscription.cancel();
    _itemController.close();
    _cardsController.close();
  }
}

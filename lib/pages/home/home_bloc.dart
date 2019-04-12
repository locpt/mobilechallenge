import 'dart:async';
import 'package:mobilechallenge/blocs/base/bloc_base.dart';
import 'package:mobilechallenge/model/card.dart';

class HomeBloc extends BlocBase {

  List<CardItem> cards;
  CardItem cardItem;

  HomeBloc(){
  }

  /*
  * Stream Controller the CardWidget
  * */
//  StreamController<CardItem> _cardWidgetController = StreamController();
//  Sink<CardItem> get cardWidgetSink => _cardWidgetController.sink;
//  Stream<CardItem> get cardWidgetStream => _cardWidgetController.stream;

  /*
  * Stream Controller the [CardItem] in ListView
  * */
  StreamController<CardItem> _cardItemController = StreamController();
  Sink<CardItem> get cardItemSink => _cardItemController.sink;
  Stream<CardItem> get cardItemStream => _cardItemController.stream;

  /*
  * Stream Controller the ListView
  * */
  StreamController<List<CardItem>> _listViewController = StreamController();
  Sink<List<CardItem>> get listSink => _listViewController.sink;
  Stream<List<CardItem>> get listStream => _listViewController.stream;

  @override
  void dispose() {
//    _cardWidgetController.close();
    _cardItemController.close();
    _listViewController.close();
  }

  void handleCardClick(CardItem data) {

  }
}

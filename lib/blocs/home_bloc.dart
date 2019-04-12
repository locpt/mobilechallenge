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
  StreamController<CardItem> _cardWidgetController = StreamController();
  Sink<CardItem> get _cardWidgetSink => _cardWidgetController.sink;
  Stream<CardItem> get _cardWidgetStream => _cardWidgetController.stream;

  /*
  * Stream Controller the [CardItem] in ListView
  * */
  StreamController<CardItem> _cardItemController = StreamController();
  Sink<CardItem> get _cardItemSink => _cardItemController.sink;
  Stream<CardItem> get _cardItemStream => _cardItemController.stream;

  /*
  * Stream Controller the ListView
  * */
  StreamController<CardItem> _listViewController = StreamController();
  Sink<CardItem> get _listSink => _listViewController.sink;
  Stream<CardItem> get _listStream => _listViewController.stream;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

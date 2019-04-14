import 'dart:async';

import 'package:mobilechallenge/model/card.dart';

abstract class CardRepository {
  Future<List<CardItem>> getCards();
}

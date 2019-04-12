import 'package:mobilechallenge/model/card.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'dart:async';

List<CardItem> createCards(int numberOfElement) {
  List<CardItem> cards;

  for (int i = 0; i < numberOfElement; i++) {
    cards.add(CardItem(
        id: i,
        score: 0,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
            .withOpacity(1.0)));
  }

  return cards;
}

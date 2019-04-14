import 'package:mobilechallenge/data/repository/card_repo.dart';
import 'package:mobilechallenge/model/card.dart';
import 'package:mobilechallenge/data/local/data.dart';

class CardRepoImpl extends CardRepository {
  @override
  Future<List<CardItem>> getCards() async {
    await Future.delayed(Duration(milliseconds: 1500));
    return cardItems;
  }
}

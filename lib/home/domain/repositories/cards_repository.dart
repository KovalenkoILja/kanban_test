import 'package:kanban_test/home/domain/entities/cards.dart';

enum CardsRowEnum {
  OnHold,
  InProgress,
  NeedsReview,
  Approved,
}

abstract class ICardsRepository {
  Future<List<Cards>> getCards(CardsRowEnum type);
}

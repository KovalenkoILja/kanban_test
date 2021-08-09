import 'package:bloc/bloc.dart';
import 'package:kanban_test/home/data/repositories/cards_repository.dart';
import 'package:kanban_test/home/domain/entities/cards.dart';
import 'package:kanban_test/home/domain/repositories/cards_repository.dart';
import 'package:meta/meta.dart';

import 'cubit_common_state.dart';

class OnHoldCubit extends Cubit<CommonCubitCardsState> {
  OnHoldCubit({@required this.cardsRepository})
      : super(CommonCubitCardsInitial());

  final CardsRepository cardsRepository;

  void load() async {
    emit(GenericCardLoading());

    try {
      final List<Cards> cards =
          await this.cardsRepository.getCards(CardsRowEnum.OnHold);
      if (cards.isNotEmpty) {
        emit(CommonCubitCardsLoaded(cards: cards));
      } else
        emit(CommonCubitCardsError(message: "Nothing to show!"));
    } catch (e) {
      emit(CommonCubitCardsError(message: e.toString()));
    }
  }
}

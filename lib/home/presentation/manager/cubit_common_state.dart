import 'package:equatable/equatable.dart';
import 'package:kanban_test/home/domain/entities/cards.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CommonCubitCardsState extends Equatable {
  const CommonCubitCardsState();
}

class CommonCubitCardsInitial extends CommonCubitCardsState {
  const CommonCubitCardsInitial();

  @override
  List<Object> get props => [];
}

class GenericCardLoading extends CommonCubitCardsState {
  const GenericCardLoading();

  @override
  List<Object> get props => [];
}

class CommonCubitCardsLoaded extends CommonCubitCardsState {
  final List<Cards> cards;

  const CommonCubitCardsLoaded({@required this.cards});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonCubitCardsLoaded &&
          runtimeType == other.runtimeType &&
          cards == other.cards;

  @override
  int get hashCode => cards.hashCode;

  @override
  List<Object> get props => [cards];
}

class CommonCubitCardsError extends CommonCubitCardsState {
  final String message;

  const CommonCubitCardsError({@required this.message});

  @override
  List<Object> get props => [message];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is CommonCubitCardsError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => super.hashCode ^ message.hashCode;
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/home/presentation/manager/approved_cubit.dart';
import 'package:kanban_test/home/presentation/manager/cubit_common_state.dart';
import 'package:kanban_test/home/presentation/manager/in_progress_cubit.dart';
import 'package:kanban_test/home/presentation/manager/needs_review_cubit.dart';
import 'package:kanban_test/home/presentation/manager/on_hold_cubit.dart';
import 'package:kanban_test/home/presentation/widgets/card_list_view.dart';
import 'package:kanban_test/home/presentation/widgets/card_msg.dart';
import 'package:kanban_test/home/presentation/widgets/cards_cubit_provider.dart';
import 'package:kanban_test/home/presentation/widgets/cards_loading.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  final int tabsLength = 4;

  List<Widget> get tabs {
    return [
      BlocBuilder<OnHoldCubit, CommonCubitCardsState>(
        builder: (context, state) {
          if (state is CommonCubitCardsError)
            return CardsMsg(message: state.message);
          else if (state is GenericCardLoading)
            return CardsLoading();
          else if (state is CommonCubitCardsLoaded) {
            return CardListView(cards: state.cards);
          } else
            return CardsLoading();
        },
      ),
      BlocBuilder<InProgressCubit, CommonCubitCardsState>(
        builder: (context, state) {
          if (state is CommonCubitCardsError)
            return CardsMsg(message: state.message);
          else if (state is GenericCardLoading)
            return CardsLoading();
          else if (state is CommonCubitCardsLoaded) {
            return CardListView(cards: state.cards);
          } else
            return CardsLoading();
        },
      ),
      BlocBuilder<NeedsReviewCubit, CommonCubitCardsState>(
        builder: (context, state) {
          if (state is CommonCubitCardsError)
            return CardsMsg(message: state.message);
          else if (state is GenericCardLoading)
            return CardsLoading();
          else if (state is CommonCubitCardsLoaded) {
            return CardListView(cards: state.cards);
          } else
            return CardsLoading();
        },
      ),
      BlocBuilder<ApprovedCubit, CommonCubitCardsState>(
        builder: (context, state) {
          if (state is CommonCubitCardsError)
            return CardsMsg(message: state.message);
          else if (state is GenericCardLoading)
            return CardsLoading();
          else if (state is CommonCubitCardsLoaded) {
            return CardListView(cards: state.cards);
          } else
            return CardsLoading();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CardsCubitProvider(tabsLength: tabsLength, tabs: tabs);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/home/data/repositories/cards_repository.dart';
import 'package:kanban_test/home/presentation/manager/approved_cubit.dart';
import 'package:kanban_test/home/presentation/manager/in_progress_cubit.dart';
import 'package:kanban_test/home/presentation/manager/needs_review_cubit.dart';
import 'package:kanban_test/home/presentation/manager/on_hold_cubit.dart';

import '../../../injection_container.dart';
import 'cards_tabs.dart';

class CardsCubitProvider extends StatelessWidget {
  const CardsCubitProvider({
    Key key,
    @required this.tabsLength,
    @required this.tabs,
  }) : super(key: key);

  final int tabsLength;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<OnHoldCubit>(
          create: (context) =>
              OnHoldCubit(cardsRepository: getIt<CardsRepository>())..load()),
      BlocProvider<InProgressCubit>(
          create: (context) =>
              InProgressCubit(cardsRepository: getIt<CardsRepository>())
                ..load()),
      BlocProvider<NeedsReviewCubit>(
          create: (context) =>
              NeedsReviewCubit(cardsRepository: getIt<CardsRepository>())
                ..load()),
      BlocProvider<ApprovedCubit>(
          create: (context) =>
              ApprovedCubit(cardsRepository: getIt<CardsRepository>())..load()),
    ], child: CardsTabs(tabsLength: tabsLength, tabs: tabs));
  }
}

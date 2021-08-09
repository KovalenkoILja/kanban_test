import 'package:flutter/material.dart';
import 'package:kanban_test/home/presentation/widgets/cards_app_bar.dart';

class CardsTabs extends StatelessWidget {
  const CardsTabs({
    Key key,
    @required this.tabsLength,
    @required this.tabs,
  }) : super(key: key);

  final int tabsLength;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabsLength,
        child: Scaffold(
            appBar: CardsAppBar(),
            body: TabBarView(
              children: tabs,
            )));
  }
}

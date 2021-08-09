import 'package:flutter/material.dart';
import 'package:kanban_test/home/domain/entities/cards.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    Key key,
    @required this.cards,
  }) : super(key: key);

  final List<Cards> cards;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var card in cards)
          Card(
            child: ListTile(
              title: Text('ID: ${card.id}'),
              subtitle: Text(
                card.text,
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
      ],
    );
  }
}

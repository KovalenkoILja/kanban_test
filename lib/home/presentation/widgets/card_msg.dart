import 'package:flutter/material.dart';

class CardsMsg extends StatelessWidget {
  const CardsMsg({
    Key key,
    @required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}

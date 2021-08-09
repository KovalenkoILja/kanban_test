import 'package:flutter/material.dart';

class CardsLoading extends StatelessWidget {
  const CardsLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

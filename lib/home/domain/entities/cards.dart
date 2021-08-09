import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Cards extends Equatable {
  final int id;
  final String row;
  final int seqNum;
  final String text;

  Cards({@required this.id, this.row, this.seqNum, this.text});

  @override
  List<Object> get props => [id, row, seqNum, text];
}

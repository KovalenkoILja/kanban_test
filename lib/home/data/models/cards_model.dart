import 'package:kanban_test/home/domain/entities/cards.dart';
import 'package:meta/meta.dart';

class CardsModel extends Cards {
  CardsModel({@required int id, String row, int seqNum, String text})
      : super(id: id, row: row, seqNum: seqNum, text: text);

  factory CardsModel.fromJson(Map<String, dynamic> json) {
    return CardsModel(
        id: (json['id'] as num).toInt(),
        row: json['row'],
        seqNum: (json['seq_num'] as num).toInt(),
        text: json['text']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "row": row,
      "seq_num": seqNum,
      "text": text,
    };
  }
}

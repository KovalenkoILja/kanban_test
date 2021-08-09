import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_test/home/data/models/cards_model.dart';
import 'package:kanban_test/home/domain/entities/cards.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final CardsModel testCardModel =
      CardsModel(id: 1757, row: "0", seqNum: 14, text: "new kazybek");

  test("should be a subclass of CardModel entity", () async {
    expect(testCardModel, isA<Cards>());
  });

  group('test converts from JSON to obj', () {
    test("should return valid model from JSON", () async {
      final List<dynamic> json = jsonDecode(fixture("cards.json"));

      final result = CardsModel.fromJson(json.first);

      expect(result, testCardModel);
    });
  });

  group('test converts to JSON from obj', () {
    test("should return valid JSON from model", () async {
      final json = testCardModel.toJson();

      final map = {
        "id": 1757,
        "row": "0",
        "seq_num": 14,
        "text": "new kazybek",
      };

      expect(json, map);
    });
  });
}

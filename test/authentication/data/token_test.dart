import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_test/authentication/data/models/token_model.dart';
import 'package:kanban_test/authentication/domain/entities/token.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMzksInVzZXJuYW1lIjoiYXJtYWRhIiwiZXhwIjoxNjI4MDk4ODEyLCJlbWFpbCI6IiIsIm9yaWdfaWF0IjoxNjI4MDk1MjEyfQ.jy1G2nIcVj-9p5PVo3xfyVgbmMnclojwWyC9aulVnk4";

  final TokenModel testTokenModel = TokenModel(token: token);

  test("should be a subclass of Token entity", () async {
    expect(testTokenModel, isA<Token>());
  });

  group('test converts from JSON to obj', () {
    test("should return valid model from JSON", () async {
      final Map<String, dynamic> json = jsonDecode(fixture("token.json"));

      final result = TokenModel.fromJson(json);

      expect(result, testTokenModel);
    });
  });

  group('test converts to JSON from obj', () {
    test("should return valid JSON from model", () async {
      final json = testTokenModel.toJson();

      final map = {
        "token": token,
      };

      expect(json, map);
    });
  });
}

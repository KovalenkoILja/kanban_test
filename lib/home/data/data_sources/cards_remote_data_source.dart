import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kanban_test/authentication/domain/entities/token.dart';
import 'package:kanban_test/core/errors/exceptions.dart';
import 'package:kanban_test/home/data/models/cards_model.dart';
import 'package:kanban_test/home/domain/entities/cards.dart';
import 'package:kanban_test/home/domain/repositories/cards_repository.dart';
import 'package:meta/meta.dart';

abstract class ICardsRemoteDataSource {
  Future<List<Cards>> getCards(
      {@required CardsRowEnum type, @required Token token});
}

const BASE_URL = 'https://trello.backend.tests.nekidaem.ru/api/v1/cards/';

class CardsRemoteDataSource implements ICardsRemoteDataSource {
  final http.Client httpClient;

  CardsRemoteDataSource({@required this.httpClient});

  String _createUrlFromType({@required CardsRowEnum type}) {
    switch (type) {
      case CardsRowEnum.OnHold:
        return '$BASE_URL?row=0';
        break;
      case CardsRowEnum.InProgress:
        return '$BASE_URL?row=1';
        break;
      case CardsRowEnum.NeedsReview:
        return '$BASE_URL?row=2';
        break;
      case CardsRowEnum.Approved:
        return '$BASE_URL?row=3';
        break;
      default:
        return '';
    }
  }

  @override
  Future<List<Cards>> getCards({CardsRowEnum type, Token token}) async {
    final response = await httpClient
        .get(Uri.parse(_createUrlFromType(type: type)), headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json; charset=utf-8',
      'Authorization': 'JWT ${token.token}'
    });
    if (response.statusCode == 200) {
      return List<Cards>.from(jsonDecode(utf8.decode(response.bodyBytes))
          .map((i) => CardsModel.fromJson(i)));
    } else {
      var message = "";
      jsonDecode(response.body).forEach((key, value) {
        value.forEach((value) {
          message += '$value ';
        });
      });
      throw ServerException(message);
    }
  }
}

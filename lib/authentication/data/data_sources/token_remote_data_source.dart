import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kanban_test/authentication/data/models/token_model.dart';
import 'package:kanban_test/core/errors/exceptions.dart';
import 'package:meta/meta.dart';

abstract class ITokenRemoteDataSource {
  Future<TokenModel> logIn(
      {@required String username, @required String password});
}

const BASE_URL = 'https://trello.backend.tests.nekidaem.ru/api/v1';

class TokenRemoteDataSource implements ITokenRemoteDataSource {
  final http.Client httpClient;

  TokenRemoteDataSource({@required this.httpClient});

  @override
  Future<TokenModel> logIn(
      {@required String username, @required String password}) async {
    final response = await httpClient.post(
      Uri.parse('$BASE_URL/users/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      return TokenModel.fromJson(jsonDecode(response.body));
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

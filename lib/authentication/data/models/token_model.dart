import 'package:kanban_test/authentication/domain/entities/token.dart';
import 'package:meta/meta.dart';

class TokenModel extends Token {
  TokenModel({@required String token}) : super(token: token);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}

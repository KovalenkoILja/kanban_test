import 'package:kanban_test/authentication/domain/entities/token.dart';

abstract class ITokenRepository {
  Future<Token> getToken();
}

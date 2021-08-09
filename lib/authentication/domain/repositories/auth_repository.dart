import 'package:kanban_test/authentication/data/models/token_model.dart';
import 'package:meta/meta.dart';

abstract class IAuthenticationRepository {
  Future<TokenModel> logIn({
    @required String username,
    @required String password,
  });

  Future<void> logOut();
}

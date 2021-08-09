import 'package:kanban_test/authentication/data/data_sources/token_locale_data_source.dart';
import 'package:kanban_test/authentication/domain/entities/token.dart';
import 'package:kanban_test/authentication/domain/repositories/token_repository.dart';
import 'package:meta/meta.dart';

class TokenRepository implements ITokenRepository {
  final ITokenLocaleDataSource localeDataSource;

  Token _token;

  TokenRepository({@required this.localeDataSource});

  @override
  Future<Token> getToken() async {
    try {
      this._token = await this.localeDataSource.readToken();
      return this._token;
    } catch (e) {
      return null;
    }
  }
}

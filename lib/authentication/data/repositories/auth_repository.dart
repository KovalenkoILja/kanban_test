import 'dart:async';

import 'package:kanban_test/authentication/data/data_sources/token_locale_data_source.dart';
import 'package:kanban_test/authentication/data/data_sources/token_remote_data_source.dart';
import 'package:kanban_test/authentication/data/models/token_model.dart';
import 'package:kanban_test/authentication/domain/repositories/auth_repository.dart';
import 'package:kanban_test/core/errors/exceptions.dart';
import 'package:kanban_test/core/network/network_info.dart';
import 'package:meta/meta.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository implements IAuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  final ITokenRemoteDataSource tokenRemoteDataSource;
  final ITokenLocaleDataSource tokenLocaleDataSource;
  final INetworkInfo networkInfo;

  AuthenticationRepository(
      {@required this.tokenLocaleDataSource,
      @required this.networkInfo,
      @required this.tokenRemoteDataSource});

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<TokenModel> logIn(
      {@required String username, @required String password}) async {
    if (await networkInfo.isConnected) {
      final token = await tokenRemoteDataSource.logIn(
          username: username, password: password);
      tokenLocaleDataSource.saveToken(token);
      _controller.add(AuthenticationStatus.authenticated);
      return token;
    } else {
      throw ServerException("Device not connected to any network!");
    }
  }

  @override
  Future<void> logOut() async {
    await tokenLocaleDataSource.deleteToken();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

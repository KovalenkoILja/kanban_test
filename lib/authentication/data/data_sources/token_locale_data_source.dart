import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kanban_test/authentication/data/models/token_model.dart';
import 'package:kanban_test/core/errors/exceptions.dart';
import 'package:meta/meta.dart';

abstract class ITokenLocaleDataSource {
  /// Save Token to FlutterSecureStorage
  ///
  /// Can throw a [CacheException]
  Future<void> saveToken(TokenModel tokenModel);

  /// Read Token from FlutterSecureStorage
  ///
  /// Can throw a [CacheException]
  Future<TokenModel> readToken();

  /// Remove Token from FlutterSecureStorage
  ///
  /// Can throw a [CacheException]
  Future<void> deleteToken();
}

const TOKEN_KEY = 'JWT_TOKEN_KEY';

class TokenLocaleDataSource implements ITokenLocaleDataSource {
  final FlutterSecureStorage storage;

  TokenLocaleDataSource({@required this.storage});

  @override
  Future<TokenModel> readToken() async {
    try {
      final json = await storage.read(key: TOKEN_KEY);
      return TokenModel.fromJson(jsonDecode(json));
    } catch (e) {
      throw CacheException("Failed to read token from storage!");
    }
  }

  @override
  Future<void> saveToken(TokenModel tokenModel) async {
    try {
      await storage.write(
          key: TOKEN_KEY, value: jsonEncode(tokenModel.toJson()));
    } catch (e) {
      throw CacheException("Couldn't write token to storage!");
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await storage.delete(key: TOKEN_KEY);
    } catch (e) {
      throw CacheException("Couldn't delete token to storage!");
    }
  }
}

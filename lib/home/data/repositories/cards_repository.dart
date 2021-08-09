import 'package:kanban_test/authentication/data/repositories/token_repository.dart';
import 'package:kanban_test/authentication/domain/entities/token.dart';
import 'package:kanban_test/core/errors/exceptions.dart';
import 'package:kanban_test/core/network/network_info.dart';
import 'package:kanban_test/home/data/data_sources/cards_remote_data_source.dart';
import 'package:kanban_test/home/domain/entities/cards.dart';
import 'package:kanban_test/home/domain/repositories/cards_repository.dart';
import 'package:meta/meta.dart';

class CardsRepository implements ICardsRepository {
  final INetworkInfo networkInfo;
  final ICardsRemoteDataSource cardRemoteDataSource;
  final TokenRepository tokenRepository;

  CardsRepository(
      {@required this.tokenRepository,
      @required this.cardRemoteDataSource,
      @required this.networkInfo});

  Future<Token> _tryGetToken() async {
    try {
      return await tokenRepository.getToken();
    } on Exception {
      return null;
    }
  }

  @override
  Future<List<Cards>> getCards(CardsRowEnum type) async {
    if (await networkInfo.isConnected) {
      final token = await _tryGetToken();
      if (token == null) throw CacheException("No Token!");
      return await cardRemoteDataSource.getCards(type: type, token: token);
    } else {
      throw ServerException("Device not connected to any network!");
    }
  }
}

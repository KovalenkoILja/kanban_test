import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:kanban_test/authentication/data/data_sources/token_locale_data_source.dart';
import 'package:kanban_test/authentication/data/data_sources/token_remote_data_source.dart';
import 'package:kanban_test/authentication/data/repositories/auth_repository.dart';
import 'package:kanban_test/authentication/data/repositories/token_repository.dart';
import 'package:kanban_test/authentication/presentation/manager/authentication_bloc.dart';
import 'package:kanban_test/authentication/presentation/manager/login_bloc.dart';
import 'package:kanban_test/home/data/data_sources/cards_remote_data_source.dart';
import 'package:kanban_test/home/data/repositories/cards_repository.dart';
import 'package:kanban_test/home/presentation/manager/approved_cubit.dart';
import 'package:kanban_test/home/presentation/manager/in_progress_cubit.dart';
import 'package:kanban_test/home/presentation/manager/needs_review_cubit.dart';
import 'package:kanban_test/home/presentation/manager/on_hold_cubit.dart';

import 'core/network/network_info.dart';

final getIt = GetIt.instance;

Future<void> initializeLocator() async {
  //BLOC
  getIt.registerFactory(() => LoginBloc(authenticationRepository: getIt()));
  getIt.registerFactory(() => AuthenticationBloc(
      authenticationRepository: getIt(), tokenRepository: getIt()));

  //Cubit
  getIt.registerFactory(() => OnHoldCubit(cardsRepository: getIt()));
  getIt.registerFactory(() => ApprovedCubit(cardsRepository: getIt()));
  getIt.registerFactory(() => InProgressCubit(cardsRepository: getIt()));
  getIt.registerFactory(() => NeedsReviewCubit(cardsRepository: getIt()));

  //Data sources
  getIt.registerLazySingleton<ITokenLocaleDataSource>(
      () => TokenLocaleDataSource(storage: getIt()));
  getIt.registerLazySingleton<ITokenRemoteDataSource>(
      () => TokenRemoteDataSource(httpClient: getIt()));
  getIt.registerLazySingleton<ICardsRemoteDataSource>(
      () => CardsRemoteDataSource(httpClient: getIt()));

  //Repository
  getIt.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepository(
          networkInfo: getIt(),
          tokenRemoteDataSource: getIt(),
          tokenLocaleDataSource: getIt()));
  getIt.registerLazySingleton<TokenRepository>(
      () => TokenRepository(localeDataSource: getIt()));
  getIt.registerLazySingleton<CardsRepository>(() => CardsRepository(
      tokenRepository: getIt(),
      networkInfo: getIt(),
      cardRemoteDataSource: getIt()));

  //Core
  getIt.registerLazySingleton<INetworkInfo>(
      () => NetworkInfo(connectivity: getIt()));

  //External
  final securedStorage = new FlutterSecureStorage();
  getIt.registerLazySingleton(() => securedStorage);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => Connectivity());
}

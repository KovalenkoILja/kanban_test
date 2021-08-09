import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/authentication/data/repositories/token_repository.dart';
import 'package:kanban_test/authentication/presentation/pages/login_page.dart';

import 'authentication/data/repositories/auth_repository.dart';
import 'authentication/presentation/manager/authentication_bloc.dart';
import 'home/presentation/pages/home_page.dart';
import 'injection_container.dart';
import 'localization/app_localizations_setup.dart';
import 'localization/manager/locale_cubit.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: getIt<AuthenticationRepository>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
          BlocProvider(
              create: (_) => AuthenticationBloc(
                    authenticationRepository: getIt<AuthenticationRepository>(),
                    tokenRepository: getIt<TokenRepository>(),
                  )),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) =>
              previousState != currentState,
          builder: (_, localeState) {
            return AppView(localeState: localeState);
          },
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({@required this.localeState});

  LocaleState localeState;

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      locale: widget.localeState.locale,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => LoginPage.route(),
    );
  }
}

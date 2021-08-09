import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/authentication/data/repositories/auth_repository.dart';
import 'package:kanban_test/authentication/presentation/manager/login_bloc.dart';
import 'package:kanban_test/localization/app_localizations.dart';
import 'package:kanban_test/localization/manager/locale_cubit.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('app_title')),
        leading: IconButton(
          icon: Icon(Icons.translate),
          onPressed: () {
            if (AppLocalizations.of(context).isEnLocale) {
              BlocProvider.of<LocaleCubit>(context).toRussian();
            } else {
              BlocProvider.of<LocaleCubit>(context).toEnglish();
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}

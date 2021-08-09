import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/authentication/presentation/manager/login_bloc.dart';
import 'package:kanban_test/localization/app_localizations.dart';

class UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).translate('username_label'),
            errorText: state.username.invalid
                ? AppLocalizations.of(context).translate('password_invalid')
                : null,
          ),
        );
      },
    );
  }
}

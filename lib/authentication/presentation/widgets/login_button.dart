import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:kanban_test/authentication/presentation/manager/login_bloc.dart';
import 'package:kanban_test/localization/app_localizations.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Container(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  child: Text(
                      AppLocalizations.of(context).translate('log_in_btn')),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.greenAccent,
                    onPrimary: Colors.black,
                  ),
                  onPressed: state.status.isValidated
                      ? () {
                          context.read<LoginBloc>().add(const LoginSubmitted());
                        }
                      : null,
                ),
              );
      },
    );
  }
}

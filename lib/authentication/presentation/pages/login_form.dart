import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:kanban_test/authentication/presentation/manager/login_bloc.dart';
import 'package:kanban_test/authentication/presentation/widgets/login_button.dart';
import 'package:kanban_test/authentication/presentation/widgets/password_input.dart';
import 'package:kanban_test/authentication/presentation/widgets/username_input.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.exceptionError)),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UsernameInput(),
              const Padding(padding: EdgeInsets.all(12)),
              PasswordInput(),
              const Padding(padding: EdgeInsets.all(12)),
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

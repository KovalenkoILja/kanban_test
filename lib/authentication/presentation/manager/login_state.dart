part of 'login_bloc.dart';

/*abstract class LoginState extends Equatable {
  const LoginState();
}*/

class LoginState extends Equatable {
  final FormzStatus status;
  final Username username;
  final Password password;
  final String exceptionError;

  LoginState(
      {this.status = FormzStatus.pure,
      this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.exceptionError = ""});

  @override
  List<Object> get props => [status, username, password, exceptionError];

  LoginState copyWith(
      {FormzStatus status,
      Username username,
      Password password,
      String error}) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      exceptionError: error ?? this.exceptionError,
    );
  }
}

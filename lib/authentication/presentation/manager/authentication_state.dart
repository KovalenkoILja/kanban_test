part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.token,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(Token token)
      : this._(status: AuthenticationStatus.authenticated, token: token);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final Token token;

  @override
  List<Object> get props => [status, token];
}

part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => <Object>[];
}

class AuthenticationTried extends AuthenticationEvent {
  AuthenticationTried({
    @required this.user,
  }) : assert(user != null);

  final User user;

  @override
  List<Object> get props => <Object>[user];
}

class AuthenticationDisproved extends AuthenticationEvent {}
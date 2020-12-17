part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => <Object>[];
}

class AuthenticationTried extends AuthenticationEvent {
  AuthenticationTried({
    @required this.customUser,
  }) : assert(customUser != null);

  final CustomUser customUser;

  @override
  List<Object> get props => <Object>[customUser];
}

class AuthenticationDisproved extends AuthenticationEvent {}
part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginFailure extends LoginState {}

class LoginViaFacebookSuccess extends LoginState {
  const LoginViaFacebookSuccess({
    @required this.customUser,
  }) : assert(customUser != null);

  final CustomUser customUser;

  @override
  List<Object> get props => <Object>[customUser];
}

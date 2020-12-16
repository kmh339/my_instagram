import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_instagram/models/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationTried) {
      yield* _mapAuthenticationTriedToState(event);
    }
  }

  Stream<AuthenticationState> _mapAuthenticationTriedToState(AuthenticationTried event) async* {
    yield AuthenticationInProgress();
    try {
      final User _user = event.user;
      yield AuthenticationTrySuccess();
    } catch (e) {
      yield AuthenticationFailure();
    }
  }
}

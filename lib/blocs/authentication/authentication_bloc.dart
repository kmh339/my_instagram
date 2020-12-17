import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_instagram/models/custom_user.dart';
import 'package:my_instagram/repositories/authentication/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(AuthenticationInitial());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationTried) {
      yield* _mapAuthenticationTriedToState(event);
    }
    if (event is AuthenticationDisproved) {
      yield* _mapAuthenticationDisprovedToState(event);
    }
  }

  Stream<AuthenticationState> _mapAuthenticationTriedToState(AuthenticationTried event) async* {
    yield AuthenticationInProgress();
    try {
      final CustomUser _customUser = await _authenticationRepository.authenticate();
      if (_customUser.id != null) {
        yield AuthenticationTrySuccess();
      } else {
        yield AuthenticationFailure();
      }
    } catch (e) {
      yield AuthenticationFailure();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationDisprovedToState(AuthenticationDisproved event) async* {
    yield AuthenticationInProgress();
    yield AuthenticationFailure();
  }
}

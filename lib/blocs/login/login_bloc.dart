import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:my_instagram/models/custom_user.dart';
import 'package:my_instagram/repositories/authentication/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(LoginInitial());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginViaFacebook) {
      yield* _mapLoginViaFacebookToState(event);
    }
  }

  Stream<LoginState> _mapLoginViaFacebookToState(LoginViaFacebook event) async* {
    yield LoginInProgress();
    try {
      final UserCredential _userCredential = await _authenticationRepository.signInWithFacebook();
      if (_userCredential != null) {
        print(_userCredential.user.displayName);
        print(_userCredential.user.uid);
        final CustomUser _customUser = CustomUser(
          id: _userCredential.user.uid,
          userName: _userCredential.user.displayName,
        );
        yield LoginViaFacebookSuccess(customUser: _customUser);
      } else {
        yield LoginFailure();
      }
    } catch (e) {
      yield LoginFailure();
    }
  }
}

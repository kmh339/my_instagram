import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_instagram/blocs/authentication/authentication_bloc.dart';
import 'package:my_instagram/pages/home/home_screen.dart';
import 'package:my_instagram/pages/login/login_screen.dart';

void main() {
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) => AuthenticationBloc(),
    child: MyInstagram(),
  ));
}

class MyInstagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyInstagram',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext buildContext, AuthenticationState state) {
          if (state is AuthenticationTrySuccess) {
            return HomeScreen();
          }
          return LoginScreen();
        },
      ),
    );
  }
}

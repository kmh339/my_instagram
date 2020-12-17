import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_instagram/blocs/authentication/authentication_bloc.dart';
import 'package:my_instagram/cubits/cubit/bottom_navigator_cubit.dart';
import 'package:my_instagram/pages/home/home_screen.dart';
import 'package:my_instagram/pages/login/login_screen.dart';
import 'package:my_instagram/pages/splash_screen.dart';
import 'package:my_instagram/repositories/authentication/authentication_repository.dart';
import 'package:my_instagram/repositories/authentication/authentication_repository_impl.dart';

import 'blocs/login/login_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    RepositoryProvider<AuthenticationRepository>(
      create: (BuildContext buildContext) => AuthenticationRepositoryImpl(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext buildContext) {
              final AuthenticationRepository _authenticationRepository = RepositoryProvider.of<AuthenticationRepository>(buildContext);
              return AuthenticationBloc(authenticationRepository: _authenticationRepository)..add(AuthenticationTried());
            },
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext buildContext) {
              final AuthenticationRepository _authenticationRepository = RepositoryProvider.of<AuthenticationRepository>(buildContext);
              return LoginBloc(authenticationRepository: _authenticationRepository);
            },
          ),
        ],
        child: MyInstagram(),
      ),
    ),
  );
}

class MyInstagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyInstagram',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext buildContext, AuthenticationState state) {
          if (state is AuthenticationTrySuccess) {
            return BlocProvider<BottomNavigatorCubit>(
              create: (BuildContext buildContext) => BottomNavigatorCubit(),
              child: HomeScreen(),
            );
          }
          if (state is AuthenticationFailure) {
            return LoginScreen();
          }
          return SplashScreen();
        },
      ),
    );
  }
}

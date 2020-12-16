import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_instagram/blocs/authentication/authentication_bloc.dart';
import 'package:my_instagram/blocs/login/login_bloc.dart';
import 'package:my_instagram/models/user.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext buildContext, LoginState state) {
        if (state is LoginViaFacebookSuccess) {
          context.read<AuthenticationBloc>().add(
                AuthenticationTried(
                  user: User(id: 1, userName: 'test', avatar: ''),
                ),
              );
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logos/instagram-logo.png',
                  height: 90,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '전화번호, 사용자 이름 또는 이메일',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '비밀번호',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerRight,
                height: 20,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  child: Text(
                    '비밀번호를 잊으셨나요?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  context.read<AuthenticationBloc>().add(
                        AuthenticationTried(
                          user: User(id: 1, userName: 'test', avatar: ''),
                        ),
                      );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue[300],
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Text(
                      '또는',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Divider(
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                alignment: Alignment.center,
                height: 20,
                child: TextButton(
                  onPressed: () => context.read<LoginBloc>().add(LoginViaFacebook()),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.white, width: 0.1),
                          color: Color(0xFF1778f2),
                        ),
                        width: 21,
                        height: 21,
                        child: Image.asset(
                          'assets/logos/facebook-logo.png',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Facebook으로 로그인',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF1778f2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Divider(
                  height: 0.5,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '계정이 없으신가요?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 50,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0),
                        ),
                        child: Text(
                          '가입하기',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

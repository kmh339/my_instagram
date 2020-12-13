import 'package:flutter/material.dart';
import 'package:my_instagram/pages/login/login_screen.dart';

void main() {
  runApp(MyInstagram());
}

class MyInstagram extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyInstagram',
      home: LoginScreen(),
    );
  }
}

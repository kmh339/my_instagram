import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Image.asset(
          'assets/logos/instagram-logo.png',
          width: 120,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 5,
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.heart,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.paperplane,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

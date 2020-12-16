import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.xmark,
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

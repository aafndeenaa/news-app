// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'Welcom to My Firts App !',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.message,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            'date',
            style: TextStyle(fontSize: 30.0),
          ),
          Text('daaaat', style: TextStyle(fontSize: 30.0)),
        ],
      ),
    );
  }
}

//
